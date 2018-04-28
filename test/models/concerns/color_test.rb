# frozen_string_literal: true

require 'test_helper'

class ColorTest < ActiveSupport::TestCase
  setup do
    @instance = build(:ping)
  end

  test 'unique codes' do
    codes =
      instance.class::GREEN +
      instance.class::YELLOW +
      instance.class::RED

    assert_equal codes.count, codes.uniq.count, 'any not uniqueness'
  end

  test 'scopes' do
    skip
  end

  test 'names' do
    assert_equal instance.class::GREEN_NAME,  'green'
    assert_equal instance.class::YELLOW_NAME, 'yellow'
    assert_equal instance.class::RED_NAME,    'red'
  end

  test 'color' do
    assert instance.green?
    assert_equal instance.color, instance_class::GREEN_NAME
  end

  test 'colors' do
    colors = instance.class.colors
    assert_equal colors.count, 3
    assert_equal colors.uniq.count, 3
  end

  test 'green?' do
    instance.code = instance.class::GREEN.sample
    assert instance.green?
  end

  test 'yellow?' do
    instance.code = instance.class::YELLOW.sample
    assert instance.yellow?
  end

  test 'red?' do
    instance.code = instance.class::RED.sample
    assert instance.red?
  end
end
