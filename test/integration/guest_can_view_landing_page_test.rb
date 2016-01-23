require "test_helper"

class GuestCanViewLandingPageTest < ActionDispatch::IntegrationTest
  test "guest can view landing page" do
    visit root_path

    assert page.has_content? "Stock Photos"
    assert page.has_button? "Begin Your Search"
  end

  test "start button leads to businesses index" do
    visit root_path
    first(:button, "Begin Your Search").click

    assert_equal current_path, businesses_path
  end
end
