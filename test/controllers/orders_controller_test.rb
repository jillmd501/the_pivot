require 'test_helper'

class OrdersControllerTest < ActionController::TestCase
  test "index" do
    get :index

    assert_equal 302, response.status
  end

  test "show" do
    get :show, id: 1

    assert_equal 302, response.status
  end

  test "update" do
    get :update, id: 1

    assert_equal 302, response.status
  end

  test "create" do
    get :create, id: 1

    assert_equal 302, response.status
  end

  test "destroy" do
    get :destroy, id: 1

    assert_equal 302, response.status
  end
end
