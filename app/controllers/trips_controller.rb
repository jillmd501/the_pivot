class TripsController < ApplicationController
  def show
    @trip = Trip.find_by_slug(params[:id])
  end

  def index
    @city = City.find_by_slug(params[:city_id])
    @trips = Trip.active_trips(@city)
  end

end
