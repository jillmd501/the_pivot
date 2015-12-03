class PhotosController < ApplicationController
  def index
    business = Business.find(params[:business_id])
    @photos = business.photos
  end
end
