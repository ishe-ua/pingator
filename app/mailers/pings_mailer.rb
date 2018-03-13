# frozen_string_literal: true

# See TargetsHelper#current_status
class PingsMailer < ApplicationMailer
  def success(ping)
    _ ping
  end

  def fail(ping)
    _ ping
  end

  def restore(ping)
    _ ping
  end

  protected

  def _(ping)
    @ping = ping
    mail to: ping.target.user.account.email,
         subject: t('.subject', host: ping.target.host)
  end
end
