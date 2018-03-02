# frozen_string_literal: true

# See AccountsController
class AccountsMailer < ApplicationMailer
  def email_confirmation(account)
    @account = account
    mail to: @account.email
  end

  # Send new Password to Account
  def new_password(account, new_password)
    @new_password = new_password
    mail to: account.email
  end
end
