# frozen_string_literal: true

require 'test_helper'

class PingUrlResultJobTest < ActiveJob::TestCase
  setup do
    @job = PingUrlResultJob
    Ping.delete_all
  end

  test 'first (success or fail) ping' do
    assert_difference 'Ping.count' do
      assert_enqueued_emails(1) do
        job.perform_now(mary.id, resp(code: [200, 404].sample))
      end
    end
  end

  test 'from success to fail' do
    skip
    assert mary.pings.last.green?
    assert_enqueued_emails(1) do
      job.perform_now(mary.id, default_response.merge(code: 404))
    end
    assert mary.pings.last.red?
  end

  test 'from fail to success' do
    skip
    mary.pings.last.destroy!
    assert mary.pings.last.red?
    assert_enqueued_emails(1) do
      job.perform_now(mary.id, default_response.merge(code: 200))
    end
    assert mary.pings.last.green?
  end

  test 'url not found result' do
    skip
    # mary.update!(url: 'https://example.com/left-url')
    # assert_no_difference('Ping.count') { job.perform_now(mary.id) }
  end

  private

  def mary
    targets(:mary)
  end

  def build_resp(opts = {})
    { start: Time.current, duration: 200, code: 200, body: 'test' }
      .merge(opts)
      .to_json
      .to_s
  end

  alias resp build_resp
end
