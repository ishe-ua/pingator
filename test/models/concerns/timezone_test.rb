# frozen_string_literal: true

require 'test_helper'

class TimezoneTest < ActiveSupport::TestCase
  setup do
    @instance = build(:user)
  end

  test 'only supported values' do
    instance.timezone = 'left/timezone'
    assert_not instance.valid?
  end
end
