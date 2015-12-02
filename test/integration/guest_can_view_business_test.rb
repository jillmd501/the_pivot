require 'test_helper'

class GuestCanViewBusinessesTest < ActionDispatch::IntegrationTest
  test 'guest can see exisiting businesses' do
    skip
    business = create_business
    visit root_path
    click_on "Businesses"
    assert_equal current_path, businesses_path
    assert page.has_content?("UnsafePond Photography")
    click_on "UnsafePond Photography"
    assert_equal current_path, business_path(business)
    assert page.has_content?("UnsafePond Photography")
    assert page.has_content?("Denver, Colorado")
    assert page.has_content?("This pond is not safe")
  end

  test "visitor can see information about a city" do
  skip
  create_business
  visit root_path
    within ".UnsafePond" do
      click_link "Learn More"
    end

  assert page.has_content? "About"
  assert page.has_link? "Return to Businesses"
  end
end
