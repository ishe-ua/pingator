# frozen_string_literal: true

# See Target, Color
module Status
  extend ActiveSupport::Concern

  SUCCESS = 'SUCCESS'
  FAIL = 'FAIL'

  # See Verification#current_verification_status
  def current_ping_status
    b = SUCCESS if success?
    b = FAIL if fail?

    raise 'Undefined status' unless defined?(b)
    b
  end

  # See http status codes
  def success?
    pings.last.green?
  end

  def fail?
    !success?
  end
end
