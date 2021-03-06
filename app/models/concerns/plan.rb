# frozen_string_literal: true

# Field +plan+ in table:
# * float
#
module Plan
  # Check Url every minutes
  NAMES = { a: 5, b: 1 }.freeze

  # For NAMES
  PRICES = { a: 0, b: 1 }.freeze

  # How many months keep (store in db) Ping.
  #
  # See CleanPingsRunnerJob
  KEEP = { a: 2, b: 12 }.freeze

  if defined?(Rails)
    extend ActiveSupport::Concern

    included do
      enum plan: NAMES

      validates :plan, presence: true
      after_initialize :set_default_plan

      scope :with_plan, ->(name) { where(plan: name) }
    end

    protected

    def set_default_plan
      self.plan ||= :a
    end
  end
end
