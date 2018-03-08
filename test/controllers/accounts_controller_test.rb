# frozen_string_literal: true

require 'test_helper'

class AccountsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @account = accounts(:mary)
  end

  test 'show register page' do
    get new_account_url
    assert_response :success
  end

  test 'create account => success' do
    assert_enqueued_emails 2 do
      assert_difference('Account.count') do
        post accounts_path, params: {
          account:          {
            email: 'company@example.com',
            password: APP::DEFAULT_PASSWORD,
            password_confirmation: APP::DEFAULT_PASSWORD
          }
        }

        assert_redirected_to controller: :pages, action: :info
      end
    end
  end

  test 'create account => fail' do
    assert_no_enqueued_emails do
      assert_no_difference('Account.count') do
        post accounts_path, params: {
          account: {
            email: '',
            password: '12345678'
          }
        }

        assert_response :success
      end
    end
  end

  test 'should get edit' do
    sign_in @account
    get edit_account_path(id: @account)
    assert_response :success
  end

  test 'should update account' do
    sign_in @account
    patch account_path(id: @account), params: {
      account: {
        email:                @account.email,
        password:              APP::DEFAULT_PASSWORD,
        password_confirmation: APP::DEFAULT_PASSWORD
      }
    }

    assert_redirected_to controller: :pages, action: :settings
  end

  test 'should update account, unconfirm email and send confirmation' do
    sign_in @account
    assert_enqueued_emails 1 do
      patch account_path(id: @account), params: {
        account: { email: 'new@example.com' }
      }

      assert_not @account.reload.email_confirmed?
      assert_redirected_to controller: :pages, action: :info
    end
  end
end
