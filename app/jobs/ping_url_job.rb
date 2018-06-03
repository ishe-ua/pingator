# frozen_string_literal: true

# Ping Target and run PingUrlResultJob
#
# We do not support FollowRedirects middleware. So users should set
# only pages without redirects (less load, free service).
#
# WARN: we can easy replace it to Erlang service (for example).
class PingUrlJob < PingJob
  def perform(target_id, target_url) # rubocop:disable AbcSize, MethodLength
    resp = OpenStruct.new(start: Time.current, duration: 0, code: 0, body: '')

    begin
      response = faraday.get(target_url)
      resp.code = response.status
      resp.body = encoded(response.body || '')
    rescue Faraday::ConnectionFailed
      resp.code = Code::BAD_CONNECTION
    ensure
      resp.duration = ((Time.current - resp.start) * 1000).to_i
      resp = formatted(resp)
    end

    PingUrlResultJob.perform_later(target_id, resp)
    resp # for tests
  end

  protected

  # gem 'faraday'
  def connection
    Faraday.new do |conn|
      conn.response(:logger) if Rails.env.development? # logger on
      conn.adapter Faraday.default_adapter
    end
  end

  alias faraday connection

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
