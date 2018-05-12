# frozen_string_literal: true

require 'test_helper'

class PingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @target = targets(:mary)
    sign_in(@target.user.account)
  end

  test 'get pings' do
    get target_pings_url(@target)
    assert_response :success
  end

  test 'get pings / any pings' do
    Ping.delete_all
    get target_pings_url(@target)
    assert_response :success
  end

  test 'show ping' do
    get target_ping_path(@target, @target.pings.first)
    assert_response :success
  end
end
