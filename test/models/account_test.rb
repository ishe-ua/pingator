# frozen_string_literal: true

require 'test_helper'

class AccountTest < ActiveSupport::TestCase
  setup do
    @instance = build(:account)
  end

  include ValidateInstanceTest
  include ValidateFixturesTest

  test 'email is uniqueness' do
    instance.email = instance.class.all.sample.email
    assert_not instance.valid?
  end
end
