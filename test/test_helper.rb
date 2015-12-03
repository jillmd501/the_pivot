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
									price: 2000,
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

def user_logs_in
	visit root_path

	click_on "Login"

	assert_equal current_path, login_path

	User.create!(username: "TestUser", password: 'password')

	fill_in 'Username', with: 'TestUser'
	fill_in 'Password', with: 'password'

	click_button 'Login'
end
