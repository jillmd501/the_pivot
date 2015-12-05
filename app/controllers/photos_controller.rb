class PhotosController < ApplicationController
  def new
    business = Business.find(params[:business_id])
    @photo = Photo.new
    # photo = business.photos << photo
  end

  def index
    business = Business.find(params[:business_id])
    @photos = business.photos
  end

  def show
    business = Business.find(params[:business_id])
    @photo = business.photos.find(params[:id])
  end

  def create
    business = Business.find(params[:business_id])
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

  private

  def photo_params
    params.require(:photo).permit(:name, :price, :description, :image)
  end
end
