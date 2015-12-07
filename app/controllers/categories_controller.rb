class CategoriesController < ApplicationController
  def show
    @category = Category.find(params[:id])
    @photos = @category.photos.all
  end
end
