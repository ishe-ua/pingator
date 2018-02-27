# frozen_string_literal: true

# Preview all emails at
# http://localhost:3000/rails/mailers/admin_mailer
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
