# frozen_string_literal: true

# See PingUrlJob
class PingUrlResultJob < PingJob
  # _Response_ param should has PingJob::RESULT_ATTRIBUTES
  def perform(target_id, response)
    target = Target.find_by(id: target_id)
    response = JSON.parse(response).deep_symbolize_keys

    return if bad?(response.keys) ||
              not_found?(target, target_id)

    prev_ping = target.last_ping
    current_ping = target.pings.create!(response)

    notify_if_status_changed?(current_ping, prev_ping)
  end

  protected

  # See PingsMailer
  def notify_if_status_changed?(current, prev)
    PingsMailer.success(current).deliver_later if to_success?(current, prev)
    PingsMailer.fail(current).deliver_later if to_fail_status?(current, prev)
  end

  def bad?(response_keys)
    b = response_keys.sort == RESULT_KEYS.sort
    Rails.logger.warn("Bad response keys #{response_keys.join ', ' }") unless b
    b
  end

  private

  def not_found?(target, target_id)
    Rails.logger.warn("Target not found (#{target_id})") if
      target.nil?
  end

  def to_success?(current, prev)
    (prev.nil? && current.green?) || (prev&.red? && current.green?)
  end

  def to_fail_status?(current, prev)
    (prev.nil? && current.red?) || (prev&.green? && current.red?)
  end
end
