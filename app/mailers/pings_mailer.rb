# frozen_string_literal: true

# See Ping, Status
class PingsMailer < ApplicationMailer
  layout 'pings_mailer'

  def success(ping)
    _ ping, Status::SUCCESS
  end

  def fail(ping)
    _ ping, Status::FAIL
  end

  protected

  def _(ping, status)
    @ping = ping
    @status = status

    mail to: ping.target.user.account.email,
         subject: "#{@status} ping <#{@ping.target.host}>"
  end
end
