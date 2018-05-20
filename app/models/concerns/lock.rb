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

  LOCKED = 'LOCKED'

  def locked?
    locked_at ? true : false
  end

  def lock!(reason)
    update!(locked_at: Time.current, lock_reason: reason)
  end

  def unlock
    update!(locked_at: nil, lock_reason: nil)
  end
end
