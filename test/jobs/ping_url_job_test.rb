# frozen_string_literal: true

require 'test_helper'

class PingUrlJobTest < ActiveJob::TestCase
  setup { @job = PingUrlJob }

  test 'success' do
    response = do_ping('https://www.google.com')
    assert response
    assert_not_empty response
    assert_instance_of Hash, response
  end

  test 'fail' do
    # @response = do_ping('https://www.google.com')
  end

  # test 'enqueue job with ping result' do
  #   skip
  # end

  # test 'response hash with right fields' do
  #   skip
  # end

  private

  def do_ping(url)
    VCR.use_cassette(url.tr('/', '_').delete(':')) do
      resp = job.perform_now(10_000, url)
      JSON.parse(resp).deep_symbolize_keys
    end
  end
end
