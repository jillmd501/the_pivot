class Admin::TripsController < Admin::BaseController
  def index
    @trips = Trip.all
  end

  def new
  end

  def create
    city = City.find_by_slug(params[:city_id])
    @trip = city.trips.create(trip_params)
    redirect_to admin_trips_path
  end

  private

  def trip_params
    params.require(:trip).permit(:name, :description, :image_path, :price, :info)
  end
end
