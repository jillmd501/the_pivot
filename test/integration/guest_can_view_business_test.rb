require 'test_helper'

class GuestCanViewBusinessesTest < ActionDispatch::IntegrationTest
  test 'guest can see exisiting businesses' do
    visit root_path
    click_on "Businesses"

    assert_equal current_path, businesses_path
    assert page.has_content?("UnsafePond Photography")

    first(:link, "UnsafePond Photography").click

    assert_equal current_path, business_path(@business.slug)
    assert page.has_content?("UnsafePond Photography")
    assert page.has_content?("Denver, Colorado")
    assert page.has_content?("This pond is not safe")
  end
end
