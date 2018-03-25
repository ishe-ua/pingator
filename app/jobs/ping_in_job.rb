# frozen_string_literal: true

# See PingOutJob
class PingInJob < ApplicationJob
  queue_as :default

  # Response from Rabbit
  def perform(target_id, start, duration, code, body)
    # TODO
  end
end
