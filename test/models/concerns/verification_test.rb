# frozen_string_literal: true

require 'test_helper'

class VerificationTest < ActiveSupport::TestCase
  setup do
    @instance = build(:target)
  end

  test 'token is required field' do
    instance.verification_token = nil
    assert_not instance.valid?
  end

  test 'unique token' do
    assert     targets(:mary).update(verification_token: 'aa')
    assert_not targets(:john).update(verification_token: 'aa')
  end
end
