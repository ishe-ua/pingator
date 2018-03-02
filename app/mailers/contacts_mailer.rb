# frozen_string_literal: true

# See ContactsController
class ContactsMailer < ApplicationMailer
  def thank_you(email)
    @email = email
    mail to: @email
  end

  # Duplicate to admin.
  def to_us(email, theme, text)
    @email = email
    @theme = theme
    @text = text

    mail to: APP::ADMIN_EMAIL, subject: 'EMAIL US from user'
  end
end
