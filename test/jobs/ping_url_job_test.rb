# frozen_string_literal: true

require 'test_helper'

class PingUrlJobTest < ActiveJob::TestCase
  setup do
    @job = PingUrlJob.new
    @target = targets(:mary)
  end

  test 'success first ping' do
    destroy_all_pings
    skip
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

  private

  def destroy_all_pings
    Ping.destroy_all
    assert_equal Ping.count, 0
  end
end
