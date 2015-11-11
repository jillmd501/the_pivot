class CategoriesController < ApplicationController
  def show
  end

  def index
    @city = City.find(params[:city_id])
  end
end
