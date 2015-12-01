require 'test_helper'

class GuestCanViewBusinessesTest < ActionDispatch::IntegrationTest
  test 'guest can see exisiting businesses' do
    create_business
    visit root_path
    click_on "Businesses"
    assert_equal current_path, businesses_path
    assert page.has_content?("UnsafePond Photography")
  end
end
