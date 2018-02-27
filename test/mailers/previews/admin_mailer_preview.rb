# frozen_string_literal: true

# Preview all emails at
# http://localhost:3000/rails/mailers/admin_mailer
class AdminMailerPreview < ActionMailer::Preview
  def stats
    AdminMailer.stats
  end

  def new_registration
    AdminMailer.new_registration(random_account)
  end

  def new_email_confirmation
    AdminMailer.new_email_confirmation(random_account)
  end

  protected

  def random_account
    Account.order('RANDOM()').first
  end
end
