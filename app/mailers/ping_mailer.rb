# frozen_string_literal: true

# See Status
class PingMailer < ApplicationMailer
  layout 'ping'

  def success(target)
    _ target
  end

  def fail(target)
    _ target
  end

  protected

  def _(target)
    @target = target
    @current_status = target.current_ping_status

    mail to: target.user.account.email,
         subject: "#{@current_status} ping <#{@target.host}>"
  end
end
