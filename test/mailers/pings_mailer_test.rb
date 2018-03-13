# frozen_string_literal: true

require 'test_helper'

class PingsMailerTest < ActionMailer::TestCase
  setup do
    @ping = Ping.sample
    @mailer = PingsMailer
  end

  teardown do
    assert_equal @mail.to, [@ping.target.user.account.email]
    assert_equal @mail.from, [APP::NOREPLY_EMAIL]
  end

  test 'success' do
    @mail = mailer.success(@ping)
  end

  test 'fail' do
    @mail = mailer.fail(@ping)
  end

  test 'restored' do
    @mail = mailer.restored(@ping)
  end
end
