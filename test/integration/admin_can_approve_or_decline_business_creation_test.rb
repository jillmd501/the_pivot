require 'test_helper'

class ApproveOrDeclineBusinessTest < ActionDispatch::IntegrationTest
  test "an admin can approve the creation of a new business" do
    user_logs_in(create_user)
    within(".create-business") do
      assert page.has_link?("Apply!")
      first(:link, "Apply!").click
    end
    assert new_business_path, current_path
    fill_in "Name", with: "Cool New Business"
    fill_in "Location", with: "Cooltown"
    fill_in "Bio", with: "The cooliest of cool"
    click_on "Apply!"
    assert page.has_content?("Your business is being reviewed")
    assert_equal dashboard_path, current_path
  end
end
