# frozen_string_literal: true

class ContactsMailerPreview < ActionMailer::Preview
  def thank_you
    ContactsMailer.thank_you(email)
  end

  def to_us
    ContactsMailer.to_us(email, 'aa', 'bb')
  end

  private

  def email
    Account.sample.email
  end
end
