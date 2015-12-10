class Admin::OrdersController < Admin::BaseController
  def show
    @order = current_order
  end
end
