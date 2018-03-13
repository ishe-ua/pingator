# frozen_string_literal: true

require 'test_helper'

class TargetTest < ActiveSupport::TestCase
  setup do
    @instance = build(:target)
  end

  include ValidateInstanceTest
  include ValidateFixturesTest

  test 'last_ping => from redis' do
    skip
  end

  test 'last_ping => from db' do
    last_ping = targets(:mary).last_ping
    assert_equal last_ping.code, 200
  end
end
