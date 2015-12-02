require 'test_helper'

class GuestCanViewBusinessesTest < ActionDispatch::IntegrationTest
  test 'guest can see exisiting businesses' do
    create_business
    visit root_path
    click_on "Businesses"
    assert_equal current_path, businesses_path
    assert page.has_content?("UnsafePond Photography")
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
