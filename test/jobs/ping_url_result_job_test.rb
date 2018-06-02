# frozen_string_literal: true

require 'test_helper'

class PingUrlResultJobTest < ActiveJob::TestCase
  setup { @job = PingUrlResultJob }

  test 'success first ping' do
    skip
    destroy_all_pings
    assert_enqueued_emails(1) do
      job.perform_now(mary.id, default_response.merge(code: 200))
    end
  end

  test 'fail first ping' do
    skip
    destroy_all_pings
    assert_enqueued_emails(1) do
      job.perform_now(mary.id, default_response.merge(code: 404))
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

  # stub
  def default_response
    { start: Time.current, duration: 10, code: 200, body: 'test' }
  end

  def destroy_all_pings
    Ping.destroy_all
    assert_equal Ping.count, 0
  end
end