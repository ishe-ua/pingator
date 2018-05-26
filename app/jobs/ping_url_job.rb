# frozen_string_literal: true

# Ping Target and run PingUrlResultJob
class PingUrlJob < ApplicationJob
  queue_as :default

  def perform(target_id, target_url) # rubocop:disable AbcSize, MethodLength, LineLength
    start = nil
    duration = nil

    ActiveSupport::Notifications
      .subscribe('request.faraday') do |_, starts, ends, _, _|
      start = starts
      duration = ((ends - starts) * 1000).to_i
    end

    response = faraday.get(target_url)

    code = response.try(:status) || response.try(:code)
    body = response.body

    PingUrlResultJob.perform_later(target_id,
                                   start,
                                   duration,
                                   code,
                                   body)
  rescue => e
    Rails.logger.error e.message
  end

  protected

  # gem 'faraday'
  #
  # FaradayMiddleware::FollowRedirects - dont support. Users should
  # set only pages without redirects (less load balance, our service
  # is free).
  def faraday
    Faraday.new do |conn|
      conn.response(:logger) if Rails.env.development?
      conn.use :instrumentation
      conn.adapter Faraday.default_adapter
    end
  end
end
