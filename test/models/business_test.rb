require 'test_helper'

class BusinessTest < ActiveSupport::TestCase
  test "toggle status" do
  	business = @business
   	assert_equal "Online", business.status

    business.toggle_status

	assert_equal "Offline", business.status    
  end
end
