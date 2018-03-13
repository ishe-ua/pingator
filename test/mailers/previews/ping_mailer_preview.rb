# frozen_string_literal: true

# Preview all emails at
# http://localhost:3000/rails/mailers/ping_mailer
class PingMailerPreview < ActionMailer::Preview
  def success
    PingMailer.success(Target.sample)
  end

  def fail
    PingMailer.success(Target.sample)
  end
end
