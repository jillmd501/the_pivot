ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require "capybara/rails"

class ActiveSupport::TestCase
  fixtures :all
end

class ActionDispatch::IntegrationTest
  include Capybara::DSL

  def visitor_adds_trip_to_cart
    @city = City.create(name: "Vail",
                       image_path: "www.vail.jpeg")

    @city.trips.create(name: "Outdoor fun",
                           price: 100,
                           description: "biking",
                           image_path: "www.biking.jpeg")

    visit city_trips_path(@city)

    click_link "Add to Cart"
  end

  def teardown
    reset_session!
  end
end
