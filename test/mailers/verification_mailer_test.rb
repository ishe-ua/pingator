# frozen_string_literal: true

require 'test_helper'

class VerificationMailerTest < ActionMailer::TestCase
  setup do
    @mailer = VerificationMailer
    @target = targets(:mary)
  end

  test 'success' do
    mail = mailer.success(@target)
    assert_equal [@target.user.account.email], mail.to
  end

  test 'fail' do
    mail = mailer.fail(@target)
    assert_equal [@target.user.account.email], mail.to
  end
end
