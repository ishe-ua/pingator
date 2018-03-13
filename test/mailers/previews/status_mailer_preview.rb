# frozen_string_literal: true

class StatusMailerPreview < ActionMailer::Preview
  def success
    StatusMailer.success(Ping.sample)
  end

  def fail
    StatusMailer.fail(Ping.sample)
  end
end
