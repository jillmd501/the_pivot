ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'capybara/rails'
require 'mocha/mini_test'
require 'minitest/pride'
require 'database_cleaner'
require 'simplecov'
require 'minitest/reporters'

class ActiveSupport::TestCase
	DatabaseCleaner.strategy = :transaction
	SimpleCov.start("rails")
	Minitest::Reporters.use! [Minitest::Reporters::SpecReporter.new, Minitest::Reporters::ProgressReporter.new]

	def setup
		DatabaseCleaner.start
	end

	def teardown
		DatabaseCleaner.clean
	end

	def create_business
		Business.create!(name: "UnsafePond Photography",
										 location: "Denver, Colorado",
										 bio: "This pond is not safe")
	end

	def create_photo(business)
		Photo.create!(name: "Ross's Baby Pic",
									description: "BEARDED BABY",
									business_id: business.id)
	end
end

class ActionDispatch::IntegrationTest
  include Capybara::DSL

  def teardown
    reset_session!
  end
end

def business_admin_creates_account
	@business_admin = User.create(username: "business_admin",
											 password: "password",
											 role: 1)
end

def platform_admin_creates_account
	@platform_admin = User.create(username: "platform_admin",
											 password: "password",
											 role: 2)
end

def guest_adds_photo_to_cart
	create_business
	@photo = create_trip(@business)
	visit business_photos_path(@business)
	click_link "Add to Cart"
end

def user_logs_in
	visit root_path

	click_on "Login"

	assert_equal current_path, login_path

	User.create!(username: "TestUser", password: 'password')

	fill_in 'Username', with: 'TestUser'
	fill_in 'Password', with: 'password'

	click_button 'Login'
end

def user_creates_account
	visit root_path

	click_on "Create Account"

	assert_equal new_user_path, current_path

	fill_in("Username", with: "TestUser2")
	fill_in("Email", with: "TestUser2@example.com")
	fill_in("Password", with: "password")
	fill_in("First Name", with: "dude")
	fill_in("Last Name", with: "dudezzz")


	click_button("Create Account")

end
