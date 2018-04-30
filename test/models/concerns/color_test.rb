# frozen_string_literal: true

require 'test_helper'

class ColorTest < ActiveSupport::TestCase
  setup do
    @instance = build(:ping)
  end

  test 'unique codes' do
    codes =
      instance.class::GREEN_CODES  +
      instance.class::YELLOW_CODES +
      instance.class::RED_CODES

    assert_equal codes.count, codes.uniq.count, 'any not uniqueness'
  end

  test 'scopes' do
    skip
  end

  test 'color_by' do
    skip
  end

  test 'names' do
    assert_equal instance.class::GREEN,  :green
    assert_equal instance.class::YELLOW, :yellow
    assert_equal instance.class::RED,    :red
  end

  test 'color' do
    assert instance.green?
    assert_equal instance.color, instance_class::GREEN
  end

  test 'green?' do
    instance.code = instance.class::GREEN_CODES.sample
    assert instance.green?
  end

  test 'yellow?' do
    instance.code = instance.class::YELLOW_CODES.sample
    assert instance.yellow?
  end

  test 'red?' do
    instance.code = instance.class::RED_CODES.sample
    assert instance.red?
  end
end
