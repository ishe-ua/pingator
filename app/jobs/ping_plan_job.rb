# frozen_string_literal: true

# Run PingTargetJob for each Target.
#
# See Clock
class PingPlanJob < ApplicationJob
  queue_as :default

  def perform(plan_name)
    Target.where(plan: plan_name).find_each do |t|
      PingTargetJob.perform_later(t)
    end
  end
end
