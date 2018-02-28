# frozen_string_literal: true

# Verified Url (through DNS) or not.
#
# Fields in table:
#
# 1. +verified_at+ When verified (nil - not verified)
# 2. +verification_token+
#
module Verification
  extend ActiveSupport::Concern

  VERIFICATION_TOKEN_SIZE = 40

  included do
    after_initialize :set_default_verification_token
    validates :verification_token, presence: true, uniqueness: true
  end

  def verified?
    verified_at ? true : false
  end

  def verify!
    update!(verified_at: Time.zone.now)
  end

  def unverify
    update_columns( # rubocop:disable SkipsModelValidations
      verified_at: nil,
      verification_token: gen_random_token
    )
  end

  protected

  def set_default_verification_token
    self.verification_token ||= gen_random_token
  end

  private

  def gen_random_token
    size = VERIFICATION_TOKEN_SIZE
    Array.new(size) { [*'0'..'9', *'a'..'z'].sample }.join
  end
end
