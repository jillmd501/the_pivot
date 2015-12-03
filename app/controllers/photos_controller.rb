class PhotosController < ApplicationController
  def index
    business = Business.find(params[:business_id])
    @photos = business.photos
    @sizes = set_sizes
  end

  private

  def set_sizes
    %w(Thumbnail Small Medium Large)
  end
end
