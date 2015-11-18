require "test_helper"

class VisitorCanSeeLandingPageTest < ActionDispatch::IntegrationTest
  test "visitor can see landing page" do
    visit root_path

    assert page.has_content? "coloRIDEo"
    assert page.has_link? "Start Your Adventure"
  end

  test "start button leads to cities index" do
    visit root_path
    first(:link, "Start Your Adventure").click

    assert_equal current_path, cities_path
  end
end
