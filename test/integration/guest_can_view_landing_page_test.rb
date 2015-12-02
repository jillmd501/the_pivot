require "test_helper"

class GuestCanViewLandingPageTest < ActionDispatch::IntegrationTest
  test "guest can view landing page" do
    skip
    visit root_path

    assert page.has_content? "Stalk Photos"
    assert page.has_link? "Let's stalk!"
  end

  test "start button leads to businesses index" do
    skip
    visit root_path
    first(:link, "Let's stalk!").click

    assert_equal current_path, businesses_path
  end
end
