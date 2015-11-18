require "test_helper"

class VisitorCanSeeCitiesTest < ActionDispatch::IntegrationTest
  test "visitor can see existing cities" do
    create_city
    visit cities_path

    assert page.has_content?("Choose Your Adventure")
    assert page.has_content?("Vail")
  end

  test "visitor can see information about a city" do
    create_city
    visit cities_path
    within ".vail" do
      click_link "Learn More"
    end

    assert page.has_content? "Short description"
    assert page.has_content? "Long description"
    assert page.has_link? "Return to Cities"
  end
end
