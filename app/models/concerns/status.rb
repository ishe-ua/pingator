# frozen_string_literal: true

# See Target, Color
module Status
  extend ActiveSupport::Concern

  SUCCESS = 'success'
  WARN    = 'warn'
  FAIL    = 'fail'
  UNKNOWN = 'unknown'

  # See Verification#current_verification_status
  def current_ping_status
    b = nil

    b = SUCCESS if !b && success?
    b = WARN    if !b && warn?
    b = FAIL    if !b && fail?

    b || UNKNOWN
  end

  def success?
    last_ping&.green?
  end

  def warn?
    last_ping&.yellow?
  end

  def fail?
    last_ping&.red?
  end
end
