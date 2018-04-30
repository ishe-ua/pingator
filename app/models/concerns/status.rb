# frozen_string_literal: true

# See Target, Color
module Status
  extend ActiveSupport::Concern

  SUCCESS   = :success
  WARN      = :warn
  FAIL      = :fail
  UNDEFINED = :undefined

  # See Verification#current_verification_status
  def current_ping_status
    (SUCCESS if success?) ||
      (WARN if warn?) ||
      (FAIL if fail?) || UNDEFINED
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
