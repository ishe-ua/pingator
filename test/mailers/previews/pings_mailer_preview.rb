# frozen_string_literal: true

# Preview all emails at
# http://localhost:3000/rails/mailers/pings_mailer
class PingsMailerPreview < ActionMailer::Preview
  def success
    PingsMailer.success(Ping.sample)
  end

  def fail
    PingsMailer.fail(Ping.sample)
  end

  def restored
    PingsMailer.restored(Ping.sample)
  end
end
