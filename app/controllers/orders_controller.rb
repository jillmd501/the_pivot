class OrdersController < ApplicationController
  def index
    @orders = current_user.orders
  end

  def show
    @order = current_user.orders.find(params[:id])
  end

  def destroy
    order = current_user.orders.find(params[:id])
    OrderCompletion.cancel(order)
    redirect_to orders_path
  end

  def create
    if current_user
      OrderCompletion.create(current_user, @cart)
      session[:cart].clear
      flash[:notice] = "Order was successfully placed."
      redirect_to orders_path
    else
      flash[:notice] = "Please log in before checking out. ╰། ◉ ◯ ◉ །╯"
      redirect_to login_path
    end
  end
end
