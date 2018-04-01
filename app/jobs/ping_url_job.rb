# frozen_string_literal: true

# gem 'faraday'
#
# See PingPlanJob, Url
class PingUrlJob < ApplicationJob
  queue_as :default

  def perform(target_id, opts = {}) # rubocop:disable AbcSize, MethodLength
    target = Target.find_tby(id: target_id)
    return unless target || target.locked? || target.user.locked?

    prev_ping = target.pings.last
    current_ping = target.pings.build

    ActiveSupport::Notifications.subscribe('request.faraday') do |_, starts, ends, _, _| # rubocop:disable LineLength
      current_ping.start = starts
      current_ping.duration = ((ends - starts) * 1000).to_i
    end

    response = Rails.env.test? ? OpenStruct.new(opts) : faraday.get(target_id)

    current_ping.code = response.status
    current_ping.body = response.body

    current_ping.save!
    notify(current_ping, prev_ping)
  rescue StandardError => e
    Rails.logger.error e.message
  end

  protected

  def faraday
    Faraday.new do |conn|
      conn.response :logger
      conn.use :instrumentation
      conn.adapter Faraday.default_adapter
    end
  end

  # See PingsMailer
  def notify(current, prev)
    PingsMailer.success(current).deliver_later if to_success?(current, prev)
    PingsMailer.fail(current).deliver_later if to_fail_status?(current, prev)
  end

  private

  def to_success?(current, prev)
    (prev&.nil? && current&.green?) || (prev&.red? && current&.green?)
  end

  def to_fail_status?(current, prev)
    (prev&.nil? && current&.red?) || (prev&.green? && current&.red?)
  end
end
