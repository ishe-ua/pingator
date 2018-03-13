# frozen_string_literal: true

require 'test_helper'

class ContactsMailerTest < ActionMailer::TestCase
  setup do
    @mailer = ContactsMailer
  end

  test 'thank_you' do
    mail = mailer.thank_you('user8@example.com')
    assert_equal ['user8@example.com'], mail.to
    assert_equal [APP::NOREPLY_EMAIL], mail.from
  end

  test 'to_us' do
    mail = mailer.to_us('user8@example.com', 'aa', 'bb')
    assert_equal [APP::ADMIN_EMAIL], mail.to
    assert_equal [APP::NOREPLY_EMAIL], mail.from
  end
end
