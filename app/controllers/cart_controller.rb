class CartController < ApplicationController
  def index
    @cart_photos = @cart.photos
  end
end
