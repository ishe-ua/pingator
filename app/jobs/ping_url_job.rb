# frozen_string_literal: true

# Ping Target and run PingUrlResultJob
#
# We do not support FollowRedirects middleware. So users should set
# only pages without redirects (less load, free service).
#
# TODO: replace to Erlang service
class PingUrlJob < ApplicationJob
  queue_as :default

  def perform(target_id, target_url) # rubocop:disable MethodLength
    response = nil
    start = nil
    duration = nil

    ActiveSupport::Notifications
      .subscribe('request.faraday') do |_, starts, ends, _, _|
      start = starts
      duration = ((ends - starts) * 1000).to_i
    end

    response = faraday.get(target_url)
    response = { start: start.to_i,
                 duration: duration.to_i,
                 code: response.status,
                 body: encoded(response.body) }
  rescue Faraday::ConnectionFailed => e
    response = { error: :url_not_found, # TODO: dry (move to constant)
                 target_id: target_id,
                 target_url: target_url }
  ensure
    PingUrlResultJob.perform_later(target_id, formatted(response))
  end

  protected

  # gem 'faraday'
  def faraday
    Faraday.new do |conn|
      conn.response(:logger) if Rails.env.development?
      conn.use :instrumentation
      conn.adapter Faraday.default_adapter
    end
  end

  # gem 'rchardet'
  def encoded(body)
    encoding = CharDet.detect(body)['encoding']
    body.force_encoding(encoding)
  end

  def formatted(response)
    response
      .deep_stringify_keys
      .to_json
      .to_s
  end
end
