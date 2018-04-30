# frozen_string_literal: true

# See Target, Color
module Status
  extend ActiveSupport::Concern

  SUCCESS   = :success
  WARN      = :warn
  FAIL      = :fail

  LIST = [SUCCESS, WARN, FAIL].freeze

  # See Verification#current_verification_status
  def current_ping_status # rubocop:disable CyclomaticComplexity
    ((SUCCESS if success?) ||
     (WARN    if warn?) ||
     (FAIL    if fail?) || APP::UNDEFINED)
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
