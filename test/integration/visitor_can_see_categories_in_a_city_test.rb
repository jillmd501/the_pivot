require "test_helper"

class VisitorCanSeeCategoriesInACityTest < ActionDispatch::IntegrationTest
  test 'visitor can see categories within a city' do
    city = City.create(name: "Vail",
                       image_path: "vail.jpeg")
    Category.create(name: "Outdoor Adventure",
                    city_id: city.id,
                    description: "Oh so fun!",
                    price: 125)

    visit cities_path

    assert page.has_content?("Choose Your Adventure")
    assert page.has_content?("Vail")

    click_link "Vail"

    assert page.has_content?("Vail Tours")
    assert page.has_content?("Outdoor Adventure")
    assert page.has_content?("Oh so fun!")
    assert page.has_content?("Price: $125")
  end
end
