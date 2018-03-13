# frozen_string_literal: true

class VerificationMailerPreview < ActionMailer::Preview
  def success
    VerificationMailer.success(Target.sample)
  end

  def fail
    VerificationMailer.fail(Target.sample)
  end
end
