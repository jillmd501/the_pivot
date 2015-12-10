class PhotosController < ApplicationController

  def catalog
    @photos = Photo.all
  end

  def index
    @business = current_business
    @photos = @business.photos
  end

  def show
    business = current_business
    @photo = business.photos.find_by(slug: params[:identifier])
  end

  def download
    data = open(sized_photo_url(params[:size]))
    send_data data.read, :type => data.content_type, :x_sendfile => true
  end
end
