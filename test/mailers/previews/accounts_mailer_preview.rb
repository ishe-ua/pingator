# frozen_string_literal: true

# Preview all emails at
# http://localhost:3000/rails/mailers/accounts_mailer
class AccountsMailerPreview < ActionMailer::Preview
  def email_confirmation
    AccountsMailer.email_confirmation(Account.sample)
  end

  def new_password
    AccountsMailer.new_password(Account.sample, 'aa23Gs')
  end
end
