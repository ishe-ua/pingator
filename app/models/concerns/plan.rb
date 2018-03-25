# frozen_string_literal: true

# Field +plan+ in table:
# * float
#
module Plan
  # Check Url every minutes
  NAMES = { a: 15, b: 5, c: 1, d: 0.5 }.freeze

  # For PLANS
  PRICES = { a: 0, b: 2, c: 5, d: 15 }.freeze

  # How many days keep Check.
  #
  # See CleanChecksRunnerJob
  KEEP = { a: 2, b: 10, c: 20, d: 30 }.freeze

  if defined?(Rails)
    extend ActiveSupport::Concern

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
end
