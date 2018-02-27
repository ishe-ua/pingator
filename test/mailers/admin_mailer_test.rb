# frozen_string_literal: true

require 'test_helper'

class AdminMailerTest < ActionMailer::TestCase
  test 'stats' do
    mail = AdminMailer.stats
    assert_equal [APP::ADMIN_EMAIL], mail.to
  end

  test 'new_registration' do
    mail = AdminMailer.new_registration(accounts(:mary))
    assert_equal [APP::ADMIN_EMAIL], mail.to
  end

  test 'new_email_confirmation' do
    mail = AdminMailer.new_email_confirmation(accounts(:john))
    assert_equal [APP::ADMIN_EMAIL], mail.to
  end
end
