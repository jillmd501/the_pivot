class TripsController < ApplicationController
  def show
    @trip = Trip.find(params[:id])
  end

  def index
    @city = City.find(params[:city_id])
    @trips = Trip.where(city_id: @city.id)
  end
end
