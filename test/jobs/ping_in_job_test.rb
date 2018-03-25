# frozen_string_literal: true

require 'test_helper'

class PinginJobTest < ActiveJob::TestCase
  setup { @job = PingInJob.new }

  test 'the truth' do
    skip
  end
end
