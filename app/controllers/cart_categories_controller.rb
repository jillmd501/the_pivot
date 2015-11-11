class CartCategoriesController < ApplicationController
  def create
    @cart.add_category(params[:category_id])
    session[:cart] = @cart.contents
    redirect_to city_categories_path(params[:city_id])
  end

  def index
    @categories = []
    @total = 0
    @cart.contents.each do |category_id, count|
      category = Category.find(category_id)
      @categories << [category, count]
      @total += category.price * count
    end
  end
end
