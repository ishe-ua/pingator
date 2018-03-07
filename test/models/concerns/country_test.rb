# frozen_string_literal: true

require 'test_helper'

class CountryTest < ActiveSupport::TestCase
  setup do
    @instance = build(:user)
  end

  test 'only two letters' do
    instance.country = 'aaa'
    assert_not instance.valid?
  end

  test 'only supported countries' do
    instance.country = 'aa'
    assert_not instance.valid?
  end
end
