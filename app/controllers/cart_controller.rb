class CartController < ApplicationController
  def index
    @cart_photos = @cart.contents
  end
end
