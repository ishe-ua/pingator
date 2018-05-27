# frozen_string_literal: true

# See PingUrlJob
class PingUrlResultJob < ApplicationJob
  queue_as :default

  def perform(target_id, response)
    response = JSON.parse(response).deep_symbolize_keys
    return if bad?(response)

    target = Target.find_by(id: target_id)
    return unless target

    prev_ping = target.last_ping
    current_ping = target.pings.create!(response)

    notify_if_status_changed?(current_ping, prev_ping) if current_ping
  rescue StandardError => e
    Rails.logger.error e.message
  end

  protected

  # See PingsMailer
  def notify_if_status_changed?(current, prev)
    PingsMailer.success(current).deliver_later if to_success?(current, prev)
    PingsMailer.fail(current).deliver_later if to_fail_status?(current, prev)
  end

  # TODO: dry to personal job
  def url_not_found?(response)
    error_code = response[:error]
    return if error_code.blank? || error_code != :url_not_found

    target_id = response[:target_id]
    target_url = response[:target_url]

    if target_id.present? && target_url.present?
      Rails.logger.warn("Url #{response[:url_not_found]}")
      end
  end

  private

  def to_success?(current, prev)
    (prev.nil? && current.green?) || (prev&.red? && current.green?)
  end

  def to_fail_status?(current, prev)
    (prev.nil? && current.red?) || (prev&.green? && current.red?)
  end
end
