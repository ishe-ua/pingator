# frozen_string_literal: true

unless defined?(Rails)
  require_relative '../config/boot'
  require_relative '../config/environment'
end

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

  every(1.week, 'Run system tasks', at: 'Friday 15:20') do
    AdminMailer.stats.deliver_later
  end

  every(1.day, 'Run system tasks', at: SYS_TIME) do
    CleanChecksRunnerJob.perform_later
  end

  Plan::NAMES.each do |plan_name, plan_interval|
    time = if plan_interval >= 1
             plan_interval.minutes
           else
             (60 * plan_interval).to_i.seconds
           end

    every(time, "Run plan #{plan_name}") do
      PingPlanJob.perform_later(plan_name.to_s)
    end
  end
end
