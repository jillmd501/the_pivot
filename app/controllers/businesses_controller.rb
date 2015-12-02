class BusinessesController < ApplicationController
  def index
    @businesses = Business.all
  end

  def show
    @business = Business.find(params[:id])
    @photos = @business.photos
  end
end
