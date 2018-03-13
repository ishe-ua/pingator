# frozen_string_literal: true

class TargetsMailerPreview < ActionMailer::Preview
  def destroy_notification
    TargetsMailer.destroy_notification(Target.sample)
  end
end
