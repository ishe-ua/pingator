# frozen_string_literal: true

# Preview all emails at
# http://localhost:3000/rails/mailers/contacts_mailer
class ContactsMailerPreview < ActionMailer::Preview
  def thank_you
    ContactsMailer.thank_you(email)
  end

  def to_us
    ContactsMailer.to_us(Account.sample.email, 'aa', 'bb')
  end
end
