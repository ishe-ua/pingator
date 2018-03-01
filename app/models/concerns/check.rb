# frozen_string_literal: true

# Fields in table:
#
# 1. +check_time+
# 2. +checked_at+ When was last check (nil - not checked)
#
module Check
  extend ActiveSupport::Concern

  # Check Url every minutes
  PLANS = { a: 15, b: 5, c: 1 }.freeze

  # For PLANS
  PRICES = { a: 0, b: 2, c: 5 }.freeze

  included do
    enum check_time: PLANS

    after_initialize :set_default_check_time
    validates :check_time, presence: true
  end

  protected

  def set_default_check_time
    self.check_time ||= :a
  end
end
