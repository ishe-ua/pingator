# frozen_string_literal: true

require 'test_helper'

class PingUrlJobTest < ActiveJob::TestCase
  setup { @job = PingUrlJob }

  test 'success first ping' do
    destroy_all_pings
    assert_enqueued_emails(1) do
      job.perform_now(@target)
    end
  end

  test 'fail first ping' do
    destroy_all_pings
    skip
  end

  test 'from success to fail' do
    skip
  end

  test 'from fail to success' do
    skip
  end

  test 'exception if left url' do
    mary.update!(url: 'https://example.com/left-url')
    assert_no_difference('Ping.count') { job.perform_now(mary.id) }
  end

  private

  def mary
    targets(:mary)
  end

  def destroy_all_pings
    Ping.destroy_all
    assert_equal Ping.count, 0
  end
end
