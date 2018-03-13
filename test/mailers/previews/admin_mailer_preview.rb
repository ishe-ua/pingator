# frozen_string_literal: true

class AdminMailerPreview < ActionMailer::Preview
  def stats
    AdminMailer.stats
  end

  def new_registration
    AdminMailer.new_registration(Account.sample)
  end

  def new_email_confirmation
    AdminMailer.new_email_confirmation(Account.sample)
  end
end
