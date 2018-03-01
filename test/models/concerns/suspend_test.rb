# frozen_string_literal: true

require 'test_helper'

class SuspendTest < ActiveSupport::TestCase
  setup do
    @instance = build(:user)
  end

  test 'required field' do
    instance.suspend = nil
    assert_not instance.valid?
  end

  test 'false by default' do
    assert_equal instance.suspend, false
  end

  test '#suspended?' do
    instance.save!

    assert instance.update(suspend: true)
    assert instance.suspended?

    assert instance.update(suspend: false)
    assert_not instance.suspended?
  end

  test '#suspend!, resume' do
    assert_not users(:mary).suspended?

    assert users(:mary).suspend!
    assert users(:mary).suspended?

    assert users(:mary).resume
    assert_not users(:mary).suspended?
  end
end
