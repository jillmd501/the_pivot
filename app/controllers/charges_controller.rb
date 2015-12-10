class ChargesController < ApplicationController
  def new
  end

  def create
    @amount = (@cart.total_cost * 100)

    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )
    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => 'Rails Stripe customer',
      :currency    => 'usd'
    )

  OrderCompletion.create(current_user, @cart)
  flash[:notice] = "Order was successfully placed"
  session.delete(:cart)
  redirect_to orders_path

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to cart_path
  end
end
