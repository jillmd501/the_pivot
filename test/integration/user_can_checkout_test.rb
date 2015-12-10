require "test_helper"

class UserCanCheckoutTest < ActionDispatch::IntegrationTest
  def checkout
    visit business_photo_path(business_name: @business.slug, identifier: @photo.slug)
    within("#photo_#{@photo.id}") do
      find(".size-select").find(:xpath, 'option[2]').select_option
      click_on "Add to Cart"
    end
    visit cart_path
    click_button "Checkout"
  end

  test "visitor cannot checkout" do
    checkout

    assert_equal login_path, current_path
  end

  test "user with cart can check out" do
    user = create_user
    user_logs_in(user)

    assert page.has_content? "Welcome, dude"
    checkout
    click_on "My Account"
    click_button "Order History"
    assert_equal orders_path, current_path

    order = user.orders.first
    within ".orders" do
      click_link "Order #{order.id}"
    end

    assert page.has_content? "Ross's Baby Pic"
  end

  test "user can download order" do
    ZipCreator.any_instance.stubs(:create).returns("this is a test")
    ZipCreator.any_instance.stubs(:tmp_filename).returns("/#{File.expand_path('pivotphotos', '~/Pictures')}/andrew.jpg")
    ZipCreator.any_instance.stubs(:stop).returns("this is a test")

    user = create_user
    user_logs_in(user)

    checkout
    click_on "My Account"
    click_button "Order History"

    order = user.orders.first
    within ".orders" do
      click_link "Order #{order.id}"
    end

    click_button "Download All"
    OrdersController.any_instance.stubs(:send_file).returns("test")
  end

  test "it works" do
    PhotosController.any_instance.stubs(:sized_photo_url).returns("/#{File.expand_path('pivotphotos', '~/Pictures')}/andrew.jpg")
    File.any_instance.stubs(:content_type).returns('image/jpg')
    user = create_user
    user_logs_in(user)

    checkout
    click_on "My Account"
    click_button "Order History"

    order = user.orders.first
    within ".orders" do
      click_link "Order #{order.id}"
    end
    click_button "Download"
  end
end
