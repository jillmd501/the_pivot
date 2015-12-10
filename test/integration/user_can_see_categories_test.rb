require 'test_helper'

class UserCanSeeCategoriesTest < ActionDispatch::IntegrationTest
  test 'user can see photos in a specific category' do
    user_logs_in(create_user)


    click_link "Businesses"

    assert page.has_content? "Businesses "

    click_link "silly"

    assert page.has_content? "All Photos for silly Category"
  end
end
