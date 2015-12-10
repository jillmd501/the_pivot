require 'test_helper'

class RoleTest < ActiveSupport::TestCase
  test "role must have name" do
  	@role = Role.new(name: "")

    assert_equal false, @role.valid?
  end
end
