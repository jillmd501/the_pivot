require 'test_helper'

class RegisteredUserTest < ActionDispatch::IntegrationTest
  test "registered user can log in" do
  	User.create!(username: "jorge@turing.io", password: 'password')

  	visit root_path

  	click_on "Login"

  	assert_equal current_path, login_path

  	fill_in 'Username', with: 'jorge@turing.io'
  	fill_in 'Password', with: 'password'

  	click_button 'Login'
  	 
  	assert_equal current_path, dashboard_path
  end
end
