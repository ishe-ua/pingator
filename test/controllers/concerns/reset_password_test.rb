# frozen_string_literal: true

require 'test_helper'

class ResetPasswordTest < ActionDispatch::IntegrationTest
  test 'should show form' do
    get reset_password_path
    assert_response :success
  end

  test 'success' do
    assert_enqueued_emails 1 do
      mary = accounts(:mary)
      password1 = mary.password_digest.dup

      post reset_password_path, params: { email: mary.email }

      assert_not_empty flash.notice
      assert_redirected_to controller: :pages, action: :info

      password2 = mary.reload.password_digest
      assert_not_equal password1, password2
    end
  end

  test 'fail' do
    post reset_password_path, params: { email: 'left-email@example.com' }
    assert_not_empty flash.alert, 'email not found'
    assert_redirected_to controller: :pages, action: :info
  end
end
