require 'test_helper'

class CartTest < ActiveSupport::TestCase
  def setup
    size = Size.create!(name: "Large", price: 25)
    @cart = Cart.new({"10" => size.id})
  end

  test "total cost" do
    assert_equal 25, @cart.total_cost
  end

  test "total count" do
    assert_equal 1, @cart.total_count
  end

  test "add photo" do
    @cart.add_photo(1, 2)
    result = @cart.total_count

    assert_equal 2, result
  end

  test "remove" do
    @cart.add_photo(2, 1)
    @cart.remove(2)

    result = @cart.total_count

    assert_equal 1, result
  end

end
