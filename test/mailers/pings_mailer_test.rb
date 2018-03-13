# frozen_string_literal: true

require 'test_helper'

class PingsMailerTest < ActionMailer::TestCase
  setup do
    @mailer = PingsMailer
  end

  test 'success' do
    skip
    mail = mailer.success
  end

  test 'fail' do
    skip
    mail = PingsMailer.fail
    assert_equal 'Fail', mail.subject
    assert_equal ['to@example.org'], mail.to
    assert_equal ['from@example.com'], mail.from
    assert_match 'Hi', mail.body.encoded
  end

  test 'restored' do
    skip
    mail = PingsMailer.restored
    assert_equal 'Restored', mail.subject
    assert_equal ['to@example.org'], mail.to
    assert_equal ['from@example.com'], mail.from
    assert_match 'Hi', mail.body.encoded
  end
end
