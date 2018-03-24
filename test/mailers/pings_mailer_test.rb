# frozen_string_literal: true

require 'test_helper'

class PingsMailerTest < ActionMailer::TestCase
  setup do
    @mailer = PingsMailer
  end

  test 'success' do
    ping = pings(:mary_success)
    mail = mailer.success(ping)
    assert_equal [ping.target.user.account.email], mail.to
  end

  test 'fail' do
    ping = pings(:mary_fail)
    mail = mailer.fail(ping)
    assert_equal [ping.target.user.account.email], mail.to
  end
end
