# frozen_string_literal: true

require 'test_helper'

class LockTest < ActiveSupport::TestCase
  setup do
    @instance = build(%i[user target].sample)
  end

  test '#lock! and #locked?' do
    mary = targets(:mary)
    assert_not mary.locked?

    assert mary.lock!
    assert mary.locked?
  end

  test '#unlock' do
    john = targets(:john)

    assert john.lock!
    assert john.locked?

    assert john.unlock
    assert_not john.locked?
  end
end
