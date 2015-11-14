class HomeController < ApplicationController
  def show
    @categories = Category.sorted
    @products = Category.find_by_name("Essentials").products.shuffle[0..2]
    @products
  end
end
