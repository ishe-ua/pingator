# frozen_string_literal: true

# See TargetsController
class TargetsMailer < ApplicationMailer
  # See Status
  def current_status(target)
    @target = target
    @current_status = 'SUCCESS' # TODO: target.current_status

    mail to: target.user.account.email,
         subject: "#{@current_status} ping <#{@target.host}>"
  end

  # See TargetsController#destroy
  def destroy_notification(target)
    @target = target
    mail to: target.user.account.email
  end
end
