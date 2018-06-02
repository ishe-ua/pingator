# frozen_string_literal: true

# Run PingUrlJob for each Target.
#
# See Clock
class PingPlanJob < ApplicationJob
  queue_as :default

  def perform(plan_name)
    Target.with_plan(plan_name).find_each do |t| # TODO: replace to pg view
      PingUrlJob.perform_later(t.id, t.url)
    end
  end
end
