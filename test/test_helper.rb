ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'capybara/rails'
require 'mocha/mini_test'
require 'minitest/pride'
require 'database_cleaner'
require 'simplecov'
# require 'minitest/reporters'

class ActiveSupport::TestCase
	DatabaseCleaner.strategy = :transaction
	SimpleCov.start("rails")
	Minitest::Reporters.use! [Minitest::Reporters::SpecReporter.new]

	def setup
		DatabaseCleaner.start
		generate_roles
		create_sizes
		@business = create_business
		@photo = create_photo(@business)
	end

	def teardown
		DatabaseCleaner.clean
	end

	def create_business
		Business.create!(name: "UnsafePond Photography",
										 location: "Denver, Colorado",
										 bio: "This pond is not safe",
										 status: "Online")
	end

	def create_photo(business)
		Photo.create!(name: "Ross's Baby Pic",
									description: "BEARDED BABY",
									business_id: business.id)
	end

	def generate_roles
	  roles = %w(registered_user business_admin platform_admin)
	  roles.each do |role|
	    Role.create(name: role)
	  end
	end

	def create_sizes
    sizes = {"Thumbnail, 64x64" => 10, "Small, 480x320" => 15, "Medium, 960x640" => 20, "Large, 1920x1280" => 25}
    sizes.each do |size, price|
      Size.create!(name: size, price: price)
    end
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
											 password: "password")
	@business_admin.roles << Role.find_by(name: "business_admin")
	@business_admin
end

def platform_admin_creates_account
	@platform_admin = User.create(username: "platform_admin",
											 password: "password")
	@platform_admin.roles << Role.find_by(name: "platform_admin")
	@platform_admin
end

def guest_adds_photo_to_cart(business)
	visit business_photo_path(business, @photo)
	within("#photo_#{@photo.id}") do
	  find(".size-select").find(:xpath, 'option[2]').select_option
	  click_on "Add to Cart"
  end
end

def user_logs_in(user)
	visit root_path

	click_on "Login"

	assert_equal current_path, login_path

	fill_in 'Username', with: user.username
	fill_in 'Password', with: "password"

	click_button 'Login'
end

def create_user
	user = User.create!(username: 'TestUser',
										 first_name: 'dude',
										 email: 'dude@dude.com',
										 last_name: 'dudezzz',
										 password: 'password'
										)
user.roles << Role.find_by(name: "registered_user")
user
end
