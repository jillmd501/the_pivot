require 'test_helper'

class VisitorCanSeeOptionsInACategoryTest < ActionDispatch::IntegrationTest
  test 'visitor can see options within a category' do
    city = City.create(name: "Vail",
                       image_path: "vail.jpeg")
    category = Category.create(name: "Entertainment",
                    city_id: city.id)
    Option.create(name: "Snowshoeing",
                  description: "Oh so fun",
                  price: 20,
                  category_id: category.id)

    visit cities_path

    assert page.has_content?("Choose Your Adventure")
    assert page.has_content?("Vail")

    click_link "Vail"

    assert page.has_content?("Vail Tours")
    assert page.has_link?("Entertainment")

    click_link "Entertainment"
    
    assert page.has_content?("Snowshoeing")
    assert page.has_content?("Oh so fun")
    assert page.has_content?("20")
  end
end
