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

  test 'should get edit' do
    get edit_target_path(id: @target)
    assert_response :success
  end

  test 'should update target' do
    patch target_path(id: @target), params: { target: { url: 'example.com/a' } }
    assert_redirected_to dash_path
  end

  test 'should destroy target' do
    assert_enqueued_emails 1 do
      assert_difference('Target.count', -1) do
        delete target_url(@target, format: :js)
      end
    end
  end
end
