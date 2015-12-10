require 'test_helper'

class ChargesControllerTest < ActionController::TestCase
  test "should get create" do
    size = Size.find_by(name: "Large")
    contents = {"10" => size.id}
    Cart.any_instance.stubs(:contents).returns(contents)
    get :create, id: 1
    
    assert_equal 302, response.status
  end
end
