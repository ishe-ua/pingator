# frozen_string_literal: true

require 'test_helper'

class PingUrlJobTest < ActiveJob::TestCase
  setup { @job = PingUrlJob }

  test 'success' do
    ping('https://www.google.com')
    assert_equal response[:code], 200
  end

  test 'fail' do
    ping 'https://left-site-23.com'
    assert_equal response[:code], Code::BAD_CONNECTION
  end

  test 'enqueue job with ping result' do
    assert_enqueued_jobs(1) { ping }
  end

  test 'response hash with right fields' do
    ping
    assert_equal response.keys.count, PingJob::RESULT_KEYS.count
    PingJob::RESULT_KEYS.shuffle.each do |key|
      assert response.key?(key.to_sym)
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
