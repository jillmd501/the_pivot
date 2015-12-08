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
    require 'zip/zip'
    require 'zip/zipfilesystem'
    @photos = current_order.order_photos.photos
    t = Tempfile.new('tmp-zip-' + request.remote_ip)
    Zip::ZipOutputStream.open(t.path) do |zos|
      @photos.each do |photo|
        binding.pry
        zos.put_next_entry(photo.attached_file_name)
        zos.print IO.read(photo.attached.path)
     end
   end
   send_file t.path, :type => "application/zip", :filename => "Photos.zip"
   t.close
  end
end
