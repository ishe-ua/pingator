# frozen_string_literal: true

# See Target, Color
module Status
  extend ActiveSupport::Concern

  SUCCESS   = :success
  WARN      = :warn
  FAIL      = :fail

  LIST = [SUCCESS, WARN, FAIL].freeze

  class_methods do
    # See Color#color_by
    def status_by(color)
      ((SUCCESS if color == Color::GREEN) ||
        (WARN if color == Color::YELLOW) ||
        (FAIL if color == Color::RED) || APP::UNDEFINED)
    end
  end

  def status # rubocop:disable CyclomaticComplexity
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
