# frozen_string_literal: true

require 'test_helper'

class ChecktimeTest < ActiveSupport::TestCase
  setup do
    @instance = build(:target)
  end

  test 'protect enum values' do
    assert_equal instance_class.checktimes[:a], 30
    assert_equal instance_class.checktimes[:b], 15
    assert_equal instance_class.checktimes[:c], 5
    assert_equal instance_class.checktimes[:d], 1
  end

  test 'required field' do
    instance.checktime = nil
    assert_not instance.valid?
  end

  test 'a plan by default' do
    assert instance.a?
  end
end
