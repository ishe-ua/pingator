# frozen_string_literal: true

# Base job for Ping
class PingJob < ApplicationJob
  RESULT_ATTRIBUTES =  Ping.new.attribute_names -
                       %w[id target_id created_at updated_at]

  queue_as :default # TODO: each queue for each plan
end
