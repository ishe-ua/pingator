# frozen_string_literal: true

require 'test_helper'

class PingUrlJobTest < ActiveJob::TestCase
  setup { @job = PingUrlJob.new }

  test 'the truth' do
    skip
  end
end
