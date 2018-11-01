# frozen_string_literal: true

require 'test_helper'

class ContactsControllerTest < ActionDispatch::IntegrationTest
  test 'should get new' do
    get new_contact_path
    assert_response :success
  end

  test 'should send two emails' do
    assert_enqueued_emails 2 do
      post contacts_path, params: { email: 'user@example.com',
                                    theme: 'aa',
                                    text: 'bb' }
    end

    assert_redirected_to controller: :pages, action: :info
  end

  test 'should stay in page if some fields are empty' do
    assert_no_emails do
      post contacts_path, params: { email: 'user@example.com',
                                    theme: '',
                                    text: '' }
      assert_response :success
    end
  end
end
