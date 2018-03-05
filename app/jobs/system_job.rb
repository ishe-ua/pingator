# frozen_string_literal: true

# Base job for system (and hard) tasks
class SystemJob < ApplicationJob
  queue_as :system
end
