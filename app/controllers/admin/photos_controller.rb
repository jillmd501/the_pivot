class Admin::PhotosController < ApplicationController
	def new
		@photo = Photo.new
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

	def index	
		@business = current_business
		@photos = current_business.photos.all
	end

	def edit
		@business = current_business
		@photo = current_photo
	end

	def update
		@business = current_business
		@photo = current_photo
		if @photo.update_attributes(photo_params)
			flash[:notice] = "Photo updated!"
			redirect_to admin_business_photo_path(@photo)
		else
			flash.now[:error] = "Something went wrong! ༼ ºل͟º༼ ºل͟º ༽ºل͟º ༽ºل͟º ༽"
			render :edit
		end
	end

	def destroy
		if current_photo.delete
			flash[:notice] = "Photo deleted! [ﾉಠೃಠ]︻̷┻̿═━一"
			redirect_to admin_business_photos_path(current_business.id)
		else
			flash[:notice] = "Something went wrong! ༼ ºل͟º༼ ºل͟º ༽ºل͟º ༽ºل͟º ༽"
			redirect_to :back
		end
	end

	private

	def photo_params
		params.require(:photo).permit(:name,
																	:description,
																	:image
																 )
	end
end