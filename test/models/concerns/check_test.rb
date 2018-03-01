# frozen_string_literal: true

require 'test_helper'

class CheckTest < ActiveSupport::TestCase
  setup do
    @instance = build(:target)
  end

  test 'protect enum values' do
    assert_equal instance_class.check_times[:a], 15
    assert_equal instance_class.check_times[:b], 5
    assert_equal instance_class.check_times[:c], 1
  end

  test 'required field' do
    instance.check_time = nil
    assert_not instance.valid?
  end

  test 'a plan by default' do
    assert instance.a?
  end
end
