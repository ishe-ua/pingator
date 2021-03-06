# frozen_string_literal: true

require 'test_helper'

class UrlTest < ActiveSupport::TestCase
  setup do
    @instance = build(:target)
  end

  test 'required field' do
    instance.url = nil
    assert_not instance.valid?
  end

  test 'unique in scope' do
    instance.url = targets(:mary).url
    assert_not instance.valid?
  end

  test 'not unique outside scope' do
    instance.url = targets(:john).url
    assert instance.valid?
  end

  test 'valid by regexp' do
    instance.url = 'xx'
    assert instance.valid?
  end

  test '#downcase_url' do
    instance.url = 'httPs://eXample.com'
    instance.save!
    assert_equal instance.url, 'https://example.com'
  end

  test '#add_http_or_https if need' do
    instance.url = 'example.com'
    instance.save!
    assert_equal instance.url, 'https://example.com'
  end

  test 'not #add_http_or_https if do not need' do
    instance.url = 'https://example.com'
    instance.save!
    assert_equal instance.url, 'https://example.com'
  end

  test 'host from url' do
    instance.url = 'https://example.com/123'
    assert_equal instance.host, 'example.com'
  end
end
