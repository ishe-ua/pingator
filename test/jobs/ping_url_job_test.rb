# frozen_string_literal: true

require 'test_helper'

class PingUrlJobTest < ActiveJob::TestCase
  setup { @job = PingUrlJob }

  test 'success' do
    ping('https://www.google.com')
    assert_equal response[:code], 200
  end

  test 'fail' do
    ping('https://any-left-site.com')
    assert_equal response[:code], Code::BAD_CONNECTION
  end

  test 'enqueue job with ping result' do
    assert_enqueued_jobs(1) { ping }
  end

  test 'response hash with right fields' do
    ping
    assert_equal response.keys.count,
                 PingUrlResultJob::INCOMING_ATTRIBUTES.count
    PingUrlResultJob::INCOMING_ATTRIBUTES.shuffle.each do |key|
      assert response.keys.include?(key.to_sym)
    end
  end

  private

  def ping(url = 'https://lb.ua')
    @response =
      VCR.use_cassette(url.tr('/', '_').delete(':')) do
      resp = job.perform_now(10_000, url)
      JSON.parse(resp).deep_symbolize_keys
    end
  end

  attr_reader :response
end
