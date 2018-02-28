# frozen_string_literal: true

require 'test_helper'

class LockTest < ActiveSupport::TestCase
  setup do
    @instance = build(:target)
  end

  test 'protect enum values' do
    assert_equal instance_class.lock_reasons[:admin], 0
    assert_equal instance_class.lock_reasons[:not_found], 1
    assert_equal instance_class.lock_reasons[:not_verified], 2
  end

  test '#lock! and #locked?' do
    mary = targets(:mary)
    assert_not mary.locked?

    assert mary.lock!(:not_found)
    assert mary.locked?
  end

  test '#unlock' do
    john = targets(:john)

    assert john.lock!(:not_verified)
    assert john.locked?

    assert john.unlock
    assert_not john.locked?
  end
end
