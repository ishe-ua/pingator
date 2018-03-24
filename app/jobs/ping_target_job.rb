# frozen_string_literal: true

# See Target, PingPlanJob
class PingTargetJob < ApplicationJob
  queue_as :default

  def perform(_target)
    # Do something later
  end
end
