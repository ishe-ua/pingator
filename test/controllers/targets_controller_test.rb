# frozen_string_literal: true

require 'test_helper'

class TargetsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @target = targets(:mary)
    sign_in(@target.user.account)
  end

  test 'should get index' do
    get targets_path
    assert_response :success
  end

  test 'should get new' do
    get new_target_path
    assert_response :success
  end
end
