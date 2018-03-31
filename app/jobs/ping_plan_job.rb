# frozen_string_literal: true

# Run PingUrlJob for each Target.
#
# See Clock
class PingPlanJob < ApplicationJob
  queue_as :default

  def perform(plan_name)
    Target.where(plan: plan_name).find_each do |t|
      PingUrlJob.perform_later(t.url)
    end
  end
end