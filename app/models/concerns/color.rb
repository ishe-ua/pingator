# frozen_string_literal: true

# HTTP status code to color matching
module Color
  extend ActiveSupport::Concern

  GREEN  = (200...300).to_a
  YELLOW = (300...400).to_a
  RED    = (400...600).to_a

  GREEN_NAME  = 'green'
  YELLOW_NAME = 'yellow'
  RED_NAME    = 'red'

  included do
    scope :greens,  -> { where code: GREENS  }
    scope :yellows, -> { where code: YELLOWS }
    scope :reds,    -> { where code: REDS    }
  end

  def color # rubocop:disable CyclomaticComplexity
    n = nil
    n = GREEN_NAME  if !n && green?
    n = YELLOW_NAME if !n && yellow?
    n = RED_NAME    if !n && red?
    n
  end

  class_methods do
    def colors
      [GREEN_NAME, YELLOW_NAME, RED_NAME]
    end
  end

  def green?
    GREEN.include?(code)
  end

  def yellow?
    YELLOW.include?(code)
  end

  def red?
    RED.include?(code)
  end
end
