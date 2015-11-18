class AdminCanViewAnOrderTest < ActionDispatch::IntegrationTest
  def setup
    @user = User.create(username: "jillmd501",
                        first_name: "Jill",
                        last_name: "Donohue",
                        password: "password",
                        address: "1510 Blake St",
                        city: "Denver",
                        state: "CO",
                        zip: 80202)
    admin = User.create(username: "admin",
                        password: "password",
                        role: 1)
    ApplicationController.any_instance.stubs(:current_user).returns(admin)

    city = City.create(name: "Vail",
                       image_path: "vail.jpg",
                       long_d: "Long description",
                       short_d: "Short description")
    trip = city.trips.create(name: "Race the Pass",
                             price: 100,
                             description: "Woosh!",
                             image_path: "race.jpg")
    @cart_trip = CartTrip.new(trip, 2, 200)
  end

  def create_order(status)
    order = Order.new(status: status,
                      total: 200,
                      status_timestamp: "January 1st, 2016",
                      user_id: @user.id)
    order.order_trips.new(trip_id: @cart_trip.id,
                          subtotal: @cart_trip.subtotal,
                          quantity: @cart_trip.quantity)
    order.save
    order
  end

  test "admin can view an individual order" do
    order = create_order(1)
    visit admin_order_path(order)

    within ".order" do
      within ".order-details" do
        assert page.has_content? "January 1st, 2016"
        assert page.has_content? "Jill Donohue"
        assert page.has_content? "1510 Blake St"
        assert page.has_content? "Denver, CO 80202"
        assert page.has_content? "$200"
        assert page.has_content? "Paid"
      end

      within ".trips" do
        assert page.has_content? "Race the Pass"
        assert page.has_content? "2"
        assert page.has_content? "$100"
        assert page.has_content? "$200"
      end

    end
  end
end
