class AdminCanViewAnOrderTest < ActionDispatch::IntegrationTest
  test "admin can view an individual order" do
    # As an authenticated Admin, when I visit an individual order page
    # Then I can see the order's date and time.
    # And I can see the purchaser's full name and address.
    # And I can see, for each trip on the order:
    # - The trip's name, which is linked to the trip page.
    # - Quantity in this order.
    # - Price
    # - Line trip subtotal.
    # And I can see the total for the order.
    # And I can see the status for the order.
    user = create_user
    order = create_order(user, 1)
    visit admin_order_path(order)

    within ".order" do
      assert page.has_content? "" # order date & time
      assert page.has_content? "" # purchaser's name
      assert page.has_content? "" # purchaser's address

      within ".trips" do
        assert page.has_content? "" # trip's name
        assert page.has_content? "" # trip's quantity
        assert page.has_content? "" # trip's price
        assert page.has_content? "" # trip's name
      end
    end
  end
end
