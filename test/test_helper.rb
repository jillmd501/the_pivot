ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'capybara/rails'
require 'mocha/mini_test'

class ActiveSupport::TestCase
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

  def user_orders_trips(user)
    city = City.create(name: "Vail",
                       image_path: "Vail.jpg")

    trip = city.trips.create(name: "Outdoor Adventure",
                             description: "Oh so fun!",
                             price: 125,
                             image_path: "www.biking.jpeg")
    second_trip = city.trips.create(name: "Telluride Trek",
                                   description: "Wow!",
                                   price: 70,
                                   image_path: "telluride.jpg")
    @order = user.orders.new(total: 320)
    @order.order_trips.new(trip_id: trip.id,
                           quantity: 2,
                           subtotal: 250)
    @order.order_trips.new(trip_id: second_trip.id,
                           quantity: 1,
                           subtotal: 70)
    @order.save
  end

  def user_creates_account
     User.create(username: "BikeBro",
                 password: "password")
  end

  def user_logs_in
    visit login_path
    fill_in "Username", with: "BikeBro"
    fill_in "Password", with: "password"
    click_button "Login"
  end

  def admin_creates_account
    admin = User.create(username: "admin",
                        password: "password",
                        role: 1)
  end

  def admin_logs_in
    visit login_path
    fill_in "Username", with: "admin"
    fill_in "Password", with: "password"
    click_button "Login"
  end

  def teardown
    reset_session!
  end
end
