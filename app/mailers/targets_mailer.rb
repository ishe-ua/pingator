# frozen_string_literal: true

# See TargetsController
class TargetsMailer < ApplicationMailer
  # See TargetsController#destroy
  def destroy_notification(target)
    @target = target
    mail to: target.user.account.email
  end
end
