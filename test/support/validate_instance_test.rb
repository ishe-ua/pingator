# frozen_string_literal: true

# Validate @instance (see +setup+ method in models tests)
module ValidateInstanceTest
  def test_instance_is_defined
    assert instance, '@instance defined'
  end

  def test_instance_is_valid
    b = instance.valid?
    puts instance.errors.full_messages unless b
    assert b, "instance of #{instance.class} is valid"
  end
end
