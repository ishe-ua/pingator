# frozen_string_literal: true

# See PingPlanJob, Url
class PingUrlJob < ApplicationJob
  queue_as :default

  def perform(url)
    # TODO
  end
end
