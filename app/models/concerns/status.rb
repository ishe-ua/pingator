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
      ((SUCCESS if color.to_sym == Color::GREEN) ||
        (WARN if color.to_sym == Color::YELLOW) ||
        (FAIL if color.to_sym == Color::RED) || APP::UNDEFINED)
    end
  end

  def status
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

  def pings_with(status)
    color_name = Ping.color_by(status).to_s.pluralize
    Ping.send(color_name).where(target_id: id)
  end
end
