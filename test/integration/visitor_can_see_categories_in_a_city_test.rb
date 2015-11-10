require 'test_helper'

class VisitorCanSeeToursInACityTest < ActionDispatch::IntegrationTest
  test 'visitor can see categories within a city' do
    city = City.create(name: "Vail",
                image_path: "vail.jpeg")
    Category.create(name: "Entertainment",
                    city_id: city.id)
    Category.create(name: "Food & Drink",
                    city_id: city.id)

    visit cities_path

    assert page.has_content?("Choose Your Adventure")
    assert page.has_content?("Vail")

    click_link "Vail"

    assert page.has_content?("Vail Tours")
    assert page.has_link?("Entertainment")
    assert page.has_link?("Food & Drink")
  end
end
