class CartPhotosController < ApplicationController
  def create
    @cart.add_photo(params[:id], params[:size])
    session[:cart] = @cart.contents
    redirect_to :back
    flash[:notice] = "Added to Cart!"
  end

  def update
    @cart.update(params[:id], params[:update_type])
    redirect_to cart_path
  end

  def destroy
    photo = Photo.find(params[:photo_id])
    @cart.remove(photo.id)
    flash[:notice] = "Successfully removed #{photo.name} from your cart."
    redirect_to cart_path
  end
end
