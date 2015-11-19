class CitiesController < ApplicationController
  def index
    @cities = City.all
  end

  def show
    @city = City.find_by_slug(params[:id])
  end
end
