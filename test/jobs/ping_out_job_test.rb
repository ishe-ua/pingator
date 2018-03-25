# frozen_string_literal: true

require 'test_helper'

class PingOutJobTest < ActiveJob::TestCase
  setup { @job = PingOutJob }

  test 'perform' do
    skip

    # plan_name = Plan::NAMES.keys.sample
    # plan_size = Target.where(plan: plan_name).count

    # assert_enqueued_jobs(plan_size) do
    #   job.perform_now(plan_name)
    # end
  end
end
