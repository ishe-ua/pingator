# frozen_string_literal: true

require 'test_helper'

class TargetsHelperTest < ActionView::TestCase
  test '#current_status - locales presence' do
    assert_key_presence 'locked'
    assert_key_presence 'success'
    assert_key_presence 'fail'
    assert_key_presence 'wait'
  end

  test '#current_status_class - locales presence' do
    assert_key_presence 'success'
  end

  private

  def assert_key_presence(key)
    assert I18n.exists?("targets_helper.current_status.#{key}")
  end
end
