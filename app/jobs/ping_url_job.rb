# frozen_string_literal: true

# See PingPlanJob, PingUrlResultJob
class PingUrlJob < ApplicationJob
  queue_as :default

  # See Target
  def perform(target_id, target_url, stubs = {})
    start = nil
    duration = nil

    ActiveSupport::Notifications.subscribe('request.faraday') do |_, starts, ends, _, _| # rubocop:disable MethodLength
      start = starts
      duration = ((ends - starts) * 1000).to_i
    end

    response = Rails.env.test? ? OpenStruct.new(stubs) : faraday.get(target_url)

    code = response.try(:status) || response.try(:code)
    body = response.body

    PingUrlResultJob.perform_later(target_id, start, duration, code, body)
  rescue StandardError => e
    Rails.logger.error e.message
  end

  protected

  # gem 'faraday'
  def faraday
    Faraday.new do |conn|
      conn.response :logger
      conn.use :instrumentation
      conn.adapter Faraday.default_adapter
    end
  end
end
