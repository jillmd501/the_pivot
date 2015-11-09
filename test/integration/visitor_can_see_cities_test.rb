require 'test_helper'

class VisitorCanSeeCitiesTest < ActionDispatch::IntegrationTest
  test 'visitor can see existing cities' do
    city = City.create(name: "Vail",
                       image_path: "vail.jpeg")
    visit '/cities'

    assert page.has_content?("Choose Your Adventure")
    assert page.has_content?("Vail")
  end
end
