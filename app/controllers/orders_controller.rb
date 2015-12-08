class OrdersController < ApplicationController
  def index
    @orders = current_user.orders
  end

  def show
    @order = current_user.orders.find(params[:id])
  end

  def create
    if current_user
      OrderCompletion.create(current_user, @cart)
      session[:cart].clear
      flash[:notice] = "Order was successfully placed."
      redirect_to orders_path
    else
      flash[:notice] = "Please log in before checking out."
      redirect_to login_path
    end
  end

  def destroy
    order = current_user.orders.find(params[:id])
    OrderCompletion.cancel(order)
    redirect_to orders_path
  end

  def download
    GC.disable
    @order_photos = current_order.order_photos
    zip_filename = "Photos.zip"
    tmp_filename = "#{Rails.root}/tmp/#{zip_filename}"
    Zip::ZipFile.open(tmp_filename, Zip::ZipFile::CREATE) do |zip|
      @order_photos.each do |order_photo|
        photo = order_photo.photo
        size = photo_size(order_photo.size.name).to_sym
        attachment = Paperclip.io_adapters.for(photo.image)
        binding.pry
        zip.add(photo.image.original_filename, attachment.path)
      end
    end
    send_data(File.open(tmp_filename, "rb+").read, :type => 'application/zip', :disposition => 'attachment', :filename => zip_filename)
    File.delete tmp_filename
    GC.enable
    GC.start
  end

  def size_method
    {medium: "med",
     thumbnail: "thumbnail",
     small: "small",
     large: "large"}
  end
end
