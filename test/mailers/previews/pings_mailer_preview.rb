# frozen_string_literal: true

class PingsMailerPreview < ActionMailer::Preview
  def success
    PingsMailer.success(Ping.sample)
  end

  def fail
    PingsMailer.fail(Ping.sample)
  end
end
