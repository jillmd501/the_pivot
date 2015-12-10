require 'test_helper'

class RoleTest < ActiveSupport::TestCase
  test "role must have name" do
  	@role = Role.new(name: "")
  	
    refute @role.valid?
  end
end
