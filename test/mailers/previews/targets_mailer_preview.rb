# frozen_string_literal: true

# Preview all emails at
# http://localhost:3000/rails/mailers/targets_mailer
class TargetsMailerPreview < ActionMailer::Preview
  def destroy_notification
    TargetsMailer.destroy_notification(Target.sample)
  end
end
