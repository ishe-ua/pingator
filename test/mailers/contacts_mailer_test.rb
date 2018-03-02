# frozen_string_literal: true

require 'test_helper'

class ContactsMailerTest < ActionMailer::TestCase
  test 'thank_you' do
    mail = ContactsMailer.thank_you('user8@example.com')
    assert_equal ['user8@example.com'], mail.to
    assert_equal [APP::NOREPLY_EMAIL], mail.from
  end

  test 'to_us' do
    mail = ContactsMailer.to_us('user8@example.com', 'aa', 'bb')
    assert_equal [APP::ADMIN_EMAIL], mail.to
    assert_equal [APP::NOREPLY_EMAIL], mail.from
  end
end
