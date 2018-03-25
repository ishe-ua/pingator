# frozen_string_literal: true

# See PingInJob, Clock
class PingOutJob < ApplicationJob
  queue_as :default

  # Target 's with Plan to Rabbit
  def perform(plan_name)
    Target.where(plan: plan_name).find_each do |t|
      to_rabbit(t.id, t.url, t.plan)
    end
  end

  protected

  def to_rabbit(target_id, target_url, target_plan)
    # TODO
  end
end
