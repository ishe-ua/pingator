# frozen_string_literal: true

require 'test_helper'

class AccountsMailerTest < ActionMailer::TestCase
  setup do
    @mailer = AccountsMailer
    @account = accounts(:mary)
  end

  test '#email_confirmation' do
    mail = mailer.email_confirmation(@account)
    assert_equal [@account.email], mail.to
  end

  test '#new_password' do
    mail = mailer.new_password(@account, 'aassACd2')
    assert_equal [@account.email], mail.to
    assert_match 'aassACd2',       mail.body.encoded
  end
end
