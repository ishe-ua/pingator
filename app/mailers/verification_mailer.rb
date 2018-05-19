# frozen_string_literal: true

# See Verification
class VerificationMailer < ApplicationMailer
  def success(target)
    @target = target
    mail to: target.user.account.email, subject: 'SUCCESS verification'
  end

  def fail(target)
    @target = target
    mail to: target.user.account.email, subject: 'FAIL verification'
  end
end
