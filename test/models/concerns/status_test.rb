# frozen_string_literal: true

require 'test_helper'

class StatusTest < ActiveSupport::TestCase
  setup do
    @instance = build(:target)
  end

  test 'last_ping => from redis' do
    skip
  end

  test 'last_ping => from db' do
    last_ping = targets(:mary).last_ping
    assert_equal last_ping.code, 400
  end

  test 'success' do
    targets(:mary).pings.last.destroy
    assert targets(:mary).ok?
  end

  test 'fail' do
    assert targets(:mary).fail?
  end
end
