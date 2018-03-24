# frozen_string_literal: true

require 'test_helper'

class PingTargetJobTest < ActiveJob::TestCase
  setup { @job = PingTargetJob.new }

  test 'the truth' do
    skip
  end
end
