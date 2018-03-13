# frozen_string_literal: true

require 'test_helper'

class TargetsMailerTest < ActionMailer::TestCase
  setup do
    @mailer = TargetsMailer
    @target = targets(:john)
  end

  test 'current_ping_status' do
    mail = mailer.current_ping_status(@target)
    assert_equal [@target.user.account.email], mail.to
  end

  test 'destroy_notification' do
    mail = mailer.destroy_notification(@target)
    assert_equal [@target.user.account.email], mail.to
  end
end
