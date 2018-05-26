# frozen_string_literal: true

# Ping Target and run PingUrlResultJob
class PingUrlJob < ApplicationJob
  queue_as :default

  def perform(target_id, target_url) # rubocop:disable MethodLength
    start = nil
    duration = nil

    ActiveSupport::Notifications
      .subscribe('request.faraday') do |_, starts, ends, _, _|
      start = starts
      duration = ((ends - starts) * 1000).to_i
    end

    response = nil
    response = faraday.get(target_url)
    response = { start: start.to_i,
                 duration: duration.to_i,
                 code: response.status,
                 body: response.body }
  rescue StandardError => e
    response = nil
    Rails.logger.info e.message
  ensure
    PingUrlResultJob.perform_later(target_id, response.deep_stringify_keys)
  end

  protected

  # gem 'faraday'
  #
  # We do not support FollowRedirects middleware. So users should set
  # only pages without redirects (less load, free service).
  def faraday
    Faraday.new do |conn|
      conn.response(:logger) if Rails.env.development?
      conn.use :instrumentation
      conn.adapter Faraday.default_adapter
    end
  end
end
