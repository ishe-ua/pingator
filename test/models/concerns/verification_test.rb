# frozen_string_literal: true

require 'test_helper'

class VerificationTest < ActiveSupport::TestCase
  setup do
    @instance = build(:target)
  end

  test 'required field' do
    instance.verification_token = nil
    assert_not instance.valid?
  end

  test 'unique field' do
    assert     targets(:mary).update(verification_token: 'aa')
    assert_not targets(:john).update(verification_token: 'aa')
  end

  test 'current_verification_status' do
    assert instance.respond_to?(:current_verification_status)
  end

  test '#verified?' do
    assert targets(:mary).verified?
    assert_not instance.verified?, 'by default all are unverified'
  end

  test '#verify!' do
    instance.save
    assert_not instance.verified?

    assert instance.verify!
    assert instance.verified?
  end

  test '#unverify' do
    targets(:mary).unverify
    assert_not targets(:mary).verified?
  end
end
