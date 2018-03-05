# frozen_string_literal: true

require 'test_helper'

class DurationTest < ActiveSupport::TestCase
  setup do
    @instance = build(:check)
  end

  test 'required field' do
    instance.duration = nil
    assert_not instance.valid?
  end

  test 'only integer' do
    instance.duration = 1.1
    assert_not instance.valid?
  end

  test 'greater_than_or_equal_to' do
    instance.duration = -1
    assert_not instance.valid?
  end
end
