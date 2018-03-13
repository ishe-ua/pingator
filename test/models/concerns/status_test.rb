# frozen_string_literal: true

require 'test_helper'

class StatusTest < ActiveSupport::TestCase
  setup do
    @instance = build(:target)
  end

  test 'current_ping_status' do
    assert instance.respond_to?(:current_ping_status)
  end

  test 'success?' do
    assert targets(:mary).success?
  end

  test 'fail?' do
    targets(:mary).pings.last.destroy
    assert targets(:mary).fail?
  end

  test 'last_ping => from redis' do
    skip
  end

  test 'last_ping => from db' do
    last_ping = targets(:mary).last_ping
    assert_equal last_ping.code, 200
  end
end
