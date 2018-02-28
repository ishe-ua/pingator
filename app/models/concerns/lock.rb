# frozen_string_literal: true

# Lock Url.
#
# Fields in table:
#
# 1. +locked_at+ When locked (nil - not locked)
# 2. +lock_reason+
#
module Lock
  extend ActiveSupport::Concern

  included do
    enum lock_reason: %i[url_not_found url_not_verified] # TODO
  end

  def locked?
    locked_at ? true : false
  end

  def lock!(reason)
    update!(locked_at: Time.zone.now, lock_reason: reason)
  end

  def unlock
    update_columns( # rubocop:disable SkipsModelValidations
      locked_at: nil,
      lock_reason: nil
    )
  end
end
