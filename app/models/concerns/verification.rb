# frozen_string_literal: true

# Verify Url through DNS.
#
# Fields in table:
#
# 1. +verification+
# 2. +verification_token+
#
module Verification
  extend ActiveSupport::Concern

  TOKEN_SIZE = 40

  included do
    enum verification: %i[wait verified not_verified]

    after_initialize :set_default_verification
    after_initialize :set_default_verification_token

    validates :verification_token, presence: true, uniqueness: true
  end

  protected

  def set_default_verification
    self.verification ||= :wait
  end

  def set_default_verification_token
    self.verification_token ||= gen_random_token
  end

  private

  def gen_random_token
    Array.new(TOKEN_SIZE) { [*'0'..'9', *'a'..'z'].sample }.join
  end
end
