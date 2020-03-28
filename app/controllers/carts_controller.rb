class CartsController < ApplicationController
  def show
    @cart = Cart.find(session[:cart_id]).cartships.joins(:product).group(:name,:unit_price).count
    @cart_id = session[:cart_id]
    @cart_summary = Cart.find(session[:cart_id])
  end

  def pay
    @amount = Cart.find(session[:cart_id]).total_price

    customer = Stripe::Customer.create(
      email: params[:stripeEmail],
      source: params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      customer: customer.id,
      amount: (@amount * 100).to_i,
      description: "Online Shop - order Payment # #{@cart_id}",
      currency: 'usd'
    )


  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path

   @cart = Cart.find(session[:cart_id])
   @cart.update(status: "Paid")
   session.delete(:cart_id)
   redirect_to root_path,notice: "Payment accepted -- Items are on their way"

  end    

end
