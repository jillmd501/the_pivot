ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'capybara/rails'
require 'mocha/mini_test'
require 'minitest/pride'
require 'database_cleaner'
require 'simplecov'

class ActiveSupport::TestCase
	DatabaseCleaner.strategy = :truncation
	SimpleCov.start("rails")
	def setup
		DatabaseCleaner.start
	end

	def teardown
		DatabaseCleaner.clean
	end
end

class ActionDispatch::IntegrationTest
  include Capybara::DSL

  def teardown
    reset_session!
  end
end
