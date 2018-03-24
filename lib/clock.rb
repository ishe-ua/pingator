# frozen_string_literal: true

require 'clockwork'
require_relative '../config/initializers/action_mailer'
require_relative '../config/initializers/active_job'
require_relative '../app/models/concerns/plan'

# App clock, gem 'clockwork'
module Clockwork
  # Time for system tasks
  SYS_TIME = '4:00'

  LOG_DIR = './log'

  LOG_FILE = 'clockwork.log'

  configure do |config|
    config[:logger] = Logger.new("#{LOG_DIR}/#{LOG_FILE}") if
      Dir.exist?(LOG_DIR)
  end

  # rubocop:disable LineLength

  every(1.week, 'Run system tasks', at: 'Friday 15:20') { AdminMailer.stats.deliver_later }
  every(1.day, 'Run system tasks', at: SYS_TIME) { CleanChecksRunnerJob.perform_later }

  # rubocop:enable LineLength

  Plan::NAMES.each do |plan_name, plan_interval|
    time = if plan_interval >= 1
             plan_interval.to_i.minutes
           else
             (60 * plan_interval).to_i.seconds
           end

    every(time, "Run plan #{plan_name}") { RunPlanJob.peform_later(plan_name) }
  end
end
