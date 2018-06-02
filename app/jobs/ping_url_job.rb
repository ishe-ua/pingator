# frozen_string_literal: true

# Ping Target and run PingUrlResultJob
#
# We do not support FollowRedirects middleware. So users should set
# only pages without redirects (less load, free service).
#
# WARN: we can easy replace it to Erlang service (for example).
class PingUrlJob < PingJob
  def perform(target_id, target_url) # rubocop:disable MethodLength
    resp = OpenStruct.new(start: 0, duration: 0, code: 0, body: '')

    resp.start = 10
    resp.duration = 20

    # ActiveSupport::Notifications
    #   .subscribe('request.faraday') do |_, starts, ends, _, _|
    #   resp.start = starts.to_i
    #   resp.duration = ((ends - starts) * 1000).to_i
    # end

    begin
      response = faraday.get(target_url)
      resp.code = response.status
      resp.body = encoded(response.body || '')
    rescue Faraday::ConnectionFailed
      resp.code = Code::BAD_CONNECTION
    ensure
      resp = formatted(resp)
    end

    PingUrlResultJob.perform_later(target_id, resp)
    resp # for tests
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
      .to_h
      .deep_stringify_keys
      .to_json
      .to_s
  end
end
