# frozen_string_literal: true

class TargetsMailerPreview < ActionMailer::Preview
  def current_ping_status
    TargetsMailer.current_ping_status(Target.sample)
  end

  def destroy_notification
    TargetsMailer.destroy_notification(Target.sample)
  end
end
