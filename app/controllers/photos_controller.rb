class PhotosController < ApplicationController
  def new
    business = current_business
    @photo = Photo.new
    # photo = business.photos << photo
  end

  def index
    business = current_business
    @photos = business.photos
  end

  def show
    business = current_business
    @photo = business.photos.find(params[:id])
  end

  def create
    business = current_business
    @photo = Photo.create(photo_params)
    if @photo.save
      business.photos << @photo
      flash[:notice] = "Photo successfully saved!"
      redirect_to business_photo_path(id: @photo)
    else
      flash[:errors] = @photo.errors.full_messages.join(", ")
      render :new
    end
  end

  def download
    data = open(current_photo.image.url(photo_size(params[:size]).to_sym))
    send_data data.read, :type => data.content_type, :x_sendfile => true
  end

  private

  def photo_size(photo_size_name)
    photo_size_name.split(", ").first.downcase
  end

  def photo_params
    params.require(:photo).permit(:name, :description, :image)
  end
end
