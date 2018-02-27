# frozen_string_literal: true

# Emails for APP admin
class AdminMailer < ApplicationMailer
  default to: "#{APP::NAME} <#{APP::ADMIN_EMAIL}>"

  # App statistics
  def stats
    mail subject: "#{APP::NAME}: stats"
  end

  # New Account registration
  def new_registration(account)
    @account = account
    mail subject: "#{APP::NAME}: new registration"
  end

  # New email confirmation
  def new_email_confirmation(account)
    @account = account
    mail subject: "#{APP::NAME}: new email confirmation"
  end
end
