# frozen_string_literal: true

# Preview all emails at
# http://localhost:3000/rails/mailers/targets_mailer
class TargetsMailerPreview < ActionMailer::Preview
  def current_status
    TargetsMailer.current_status(Target.sample)
  end

  def destroy_notification
    TargetsMailer.destroy_notification(Target.sample)
  end
end
