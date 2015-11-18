require "test_helper"

class VisitorCanSeeCitiesTest < ActionDispatch::IntegrationTest
  test "visitor can see existing cities" do
    create_city
    visit cities_path

    assert page.has_content?("Choose Your Adventure")
    assert page.has_content?("Vail")
  end
end
