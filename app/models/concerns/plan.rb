# frozen_string_literal: true

# Field +plan+ in table:
# * integer
#
module Plan
  extend ActiveSupport::Concern

  # Check Url every minutes
  NAMES = { a: 15, b: 5, c: 1 }.freeze

  # For PLANS
  PRICES = { a: 0, b: 2, c: 5 }.freeze

  # How many days keep Check.
  #
  # See CleanChecksRunnerJob
  KEEP = { a: 5, b: 15, c: 30 }.freeze

  included do
    enum plan: NAMES

    validates :plan, presence: true
    after_initialize :set_default_plan
  end

  protected

  def set_default_plan
    self.plan ||= :a
  end
end
