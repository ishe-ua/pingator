# frozen_string_literal: true

require 'test_helper'

class TargetsMailerTest < ActionMailer::TestCase
  setup do
    @target = targets(:john)
  end

  test 'destroy_notification' do
    mail = TargetsMailer.destroy_notification(@target)
    assert_equal [@target.user.account.email], mail.to
  end
end
