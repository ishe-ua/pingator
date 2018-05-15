# frozen_string_literal: true

# Validate fixtures (see models tests)
module ValidateFixturesTest
  def test_validate_fixtures
    instance.class.all.each do |obj|
      b = obj.valid?
      puts obj.errors.full_messages unless b
      assert b, "fixture of the class #{instance.class} is valid"
    end
  end
end
