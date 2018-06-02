# frozen_string_literal: true

# Field +plan+ in table:
# * float
#
module Plan
  # Check Url every minutes
  NAMES = { a: 15, b: 5, c: 1, d: 0.5 }.freeze

  # For NAMES
  PRICES = { a: 0, b: 2, c: 5, d: 15 }.freeze

  # How many days keep Ping.
  #
  # See CleanPingsRunnerJob
  KEEP = { a: 2, b: 10, c: 20, d: 30 }.freeze

  if defined?(Rails)
    extend ActiveSupport::Concern

    included do
      enum plan: NAMES

      validates :plan, presence: true
      after_initialize :set_default_plan

      protected def self.define_plans_scopes
        NAMES.keys.each do |plan_name|
          scope "#{plan_name}_plans", -> { where(plan: plan_name) }
        end
      end

      define_plans_scopes
    end

    protected

    def set_default_plan
      self.plan ||= :a
    end
  end
end
