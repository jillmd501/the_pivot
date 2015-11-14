class OrdersController < ApplicationController
  def index
    @orders = current_user.orders
  end

  def show
    @order = current_user.orders.find(params[:id])
  end

  def create
    if current_user
      # create order
      flash[:notice] = "Order was successfully placed."
      redirect_to orders_path
    else
      flash[:notice] = "Please log in before checking out."
      redirect_to login_path
    end
  end
end
