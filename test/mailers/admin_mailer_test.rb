# frozen_string_literal: true

require 'test_helper'

class AdminMailerTest < ActionMailer::TestCase
  setup do
    @mailer = AdminMailer
  end

  test 'stats' do
    mail = mailer.stats
    assert_equal [APP::ADMIN_EMAIL], mail.to
  end

  test 'new_registration' do
    mail = mailer.new_registration(accounts(:mary))
    assert_equal [APP::ADMIN_EMAIL], mail.to
  end

  test 'new_email_confirmation' do
    mail = mailer.new_email_confirmation(accounts(:john))
    assert_equal [APP::ADMIN_EMAIL], mail.to
  end
end
