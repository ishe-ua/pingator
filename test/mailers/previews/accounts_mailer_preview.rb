# frozen_string_literal: true

class AccountsMailerPreview < ActionMailer::Preview
  def email_confirmation
    AccountsMailer.email_confirmation(Account.sample)
  end

  def new_password
    AccountsMailer.new_password(Account.sample, 'aa23Gs')
  end
end
