# frozen_string_literal: true

require 'test_helper'

class EmailConfirmationTest < ActiveSupport::TestCase
  setup do
    @instance = build(:account)
  end

  test 'required field' do
    instance.email_confirmation_token = nil
    assert_not instance.valid?
  end

  test 'unique field' do
    assert     accounts(:mary).update(email_confirmation_token: 'aa')
    assert_not accounts(:john).update(email_confirmation_token: 'aa')
  end

  test '#email_confirmed?' do
    assert accounts(:mary).email_confirmed?
    assert_not instance.class.new.email_confirmed?, 'unconfirmed by default'
  end

  test '#email_confirm!' do
    instance.email_confirmation_at = nil
    instance.save
    assert_not instance.email_confirmed?

    assert instance.confirm_email!
    assert instance.email_confirmed?
  end

  test '#unconfirm_email' do
    accounts(:mary).unconfirm_email
    assert_not accounts(:mary).email_confirmed?
  end
end
