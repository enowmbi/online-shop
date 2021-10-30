class CartsController < ApplicationController
  def show
    begin
      @cart = Cart.find(session[:cart_id]).cartships.joins(:product).group(:name,:unit_price).count
      @cart_id = session[:cart_id]
      @cart_summary = Cart.find(session[:cart_id])
    rescue
      redirect_to root_path,alert: "Selected cart is no longer active, probably because it has been paid already"
    end
  end

  def pay
    @amount = Cart.find(session[:cart_id]).total_price

    customer = Stripe::Customer.create(
      email: params[:stripeEmail],
      source: params[:stripeToken]
    )

    Stripe::Charge.create(
      customer: customer.id,
      amount: (@amount * 100).to_i,
      description: "Online Shop - order Payment # #{@cart_id}",
      currency: 'usd'
    )

    @cart = Cart.find(session[:cart_id])
    @cart.update(status: "Paid")
    session.delete(:cart_id)
    PaymentNotificationJob.perform_later(@cart)
    redirect_to root_path,notice: "Payment accepted -- Items will be delivered within 48 hours"

  rescue Stripe::CardError => e
    flash[:error] = e.message
    PaymentFailureNotificationJob.perform_later(@cart)
    redirect_to cart_path(Cart.find(session[:cart_id]))

  end    

end
