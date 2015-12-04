class PhotosController < ApplicationController
  def index
    business = Business.find(params[:business_id])
    @photos = business.photos
    @sizes = set_sizes
  end

  def show
    business = Business.find(params[:business_id])
    @photo = business.photos.find(params[:id])
  end

  private

  def set_sizes
    %w(Thumbnail Small Medium Large)
  end
end
