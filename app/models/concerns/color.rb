# frozen_string_literal: true

# HTTP status code to color matching
#
# See Status
module Color
  extend ActiveSupport::Concern

  GREEN  = :green
  YELLOW = :yellow
  RED    = :red

  LIST = [GREEN, YELLOW, RED].freeze

  GREEN_CODES  = (200...300).to_a
  YELLOW_CODES = (300...400).to_a
  RED_CODES    = (400...600).to_a

  included do
    scope :greens,  -> { where code: GREEN_CODES  }
    scope :yellows, -> { where code: YELLOW_CODES }
    scope :reds,    -> { where code: RED_CODES    }
  end

  class_methods do
    # See Status#status_by
    def color_by(status)
      ((GREEN  if status.to_sym == Status::SUCCESS) ||
       (YELLOW if status.to_sym == Status::WARN) ||
       (RED    if status.to_sym == Status::FAIL) || APP::UNDEFINED)
    end
  end

  def color
    ((GREEN  if green?)  ||
     (YELLOW if yellow?) ||
     (RED    if red?)    || APP::UNDEFINED)
  end

  def green?
    GREEN_CODES.include?(code)
  end

  def yellow?
    YELLOW_CODES.include?(code)
  end

  def red?
    RED_CODES.include?(code)
  end
end
