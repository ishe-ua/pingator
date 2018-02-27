# frozen_string_literal: true

require 'clockwork'
require_relative '../config/initializers/action_mailer'
require_relative '../config/initializers/active_job'

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

  # every(1.week, 'Run system tasks', at: 'Friday 15:20') do
  #   AdminMailer.stats.deliver_later
  # end
end
