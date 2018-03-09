# frozen_string_literal: true

require 'test_helper'

class ConfirmEmailTest < ActionDispatch::IntegrationTest
  setup do
    @account = accounts(:mary)
    @account.unconfirm_email
    assert_not @account.reload.email_confirmed?
  end

  test 'success' do
    assert_enqueued_emails 1 do
      get confirm_email_path(token: @account.email_confirmation_token)
      assert_redirected_to controller: :pages, action: :info

      assert_not_nil @account.reload.email_confirmation_at
      assert_not_empty flash.notice
    end
  end

  test 'fail if left token' do
    get confirm_email_path(token: 'left-token')
    assert_redirected_to controller: :pages, action: :info

    assert_nil @account.reload.email_confirmation_at
    assert_not_empty flash.alert
  end

  test 'run #auto_sign_in after success' do
    get confirm_email_path(token: @account.email_confirmation_token)

    assert @controller.send(:signed_in?)
    assert_not_empty flash.notice
  end

  test 'repeat_email_confirmation' do
    sign_in(:mary)
    assert_enqueued_emails 1 do
      get repeat_email_confirmation_path
      assert_redirected_to controller: :pages, action: :info
    end
  end
end
