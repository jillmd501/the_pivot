ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'capybara/rails'
require 'mocha/mini_test'
require 'minitest/pride'

class ActiveSupport::TestCase
end

class ActionDispatch::IntegrationTest
  include Capybara::DSL

  def visitor_adds_trip_to_cart
    create_city
    create_trip(@city)
    visit city_trips_path(@city)
    click_link "Add to Cart"
  end

  def user_orders_trips(user)
    create_city
    trip = create_trip(@city)
    second_trip = @city.trips.create(name: "Telluride Trek",
                                     description: "Wow!",
                                     price: 50,
                                     image_path: "telluride.jpg")
    @order = user.orders.new(total: 250,
                             status: "Paid",
                             status_timestamp: "January 1st, 2016")
    @order.order_trips.new(trip_id: trip.id,
                           quantity: 2,
                           subtotal: 200)
    @order.order_trips.new(trip_id: second_trip.id,
                           quantity: 1,
                           subtotal: 50)
    @order.save
  end

  def user_creates_account
    @user = User.create(username: "BikeBro",
                        password: "password",
                        role: 0)
  end

  def admin_creates_account
    @admin = User.create(username: "admin",
                         password: "password",
                         role: 1)
  end

  def user_logs_in(user)
    visit login_path
    fill_in "Username", with: "#{user.username}"
    fill_in "Password", with: "#{user.password}"
    click_button "Login"
  end

  def teardown
    reset_session!
  end
end

def create_city
  @city = City.create(name: "Vail",
                      image_path: "www.vail.jpeg",
                      short_d: "short",
                      long_d: "long")
end

def create_trip(city)
  city.trips.create(name: "Outdoor fun",
                    price: 100,
                    description: "biking",
                    image_path: "www.biking.jpeg")
end
