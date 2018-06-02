# frozen_string_literal: true

require 'test_helper'

class PlanTest < ActiveSupport::TestCase
  setup do
    @instance = build(:target)
  end

  test 'protect enum values' do
    assert_equal instance_class.plans[:a], 15
    assert_equal instance_class.plans[:b], 5
    assert_equal instance_class.plans[:c], 1
    assert_equal instance_class.plans[:d], 0.5
  end

  test 'required field' do
    instance.plan = nil
    assert_not instance.valid?
  end

  test 'a plan by default' do
    assert instance.a?
  end

  test 'with_plan' do
    assert_not_empty instance.class.with_plan(:a)
  end
end
