class Admin::CitiesController < Admin::BaseController
  def index
    @cities = City.all
  end

  def new
  end

  def create
    @city = City.create(city_params)
    redirect_to admin_cities_path
  end

  private

  def city_params
    params.require(:city).permit(:name, :short_d, :long_d, :image_path)
  end
end
