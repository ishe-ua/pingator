# frozen_string_literal: true

require 'test_helper'

class EmailTest < ActiveSupport::TestCase
  setup do
    @instance = build(:account)
  end

  test 'required field' do
    instance.email = nil
    assert_not instance.valid?
  end

  test 'unique field' do
    instance.email = instance.class.all.sample.email
    assert_not instance.valid?
  end

  test 'only valid emails' do
    instance.email = 'not-email'
    assert_not instance.valid?
  end

  test 'downcase before validation' do
    instance.email = 'UseR@exAmple.COM'
    instance.validate
    assert_equal instance.email, 'user@example.com'
  end

  test '#nullify_email_confirmation' do
    acc = accounts(:hu)
    assert acc.email_confirmed?

    acc.update(email: 'test@example.com')
    assert_not acc.reload.email_confirmed?
  end
end
