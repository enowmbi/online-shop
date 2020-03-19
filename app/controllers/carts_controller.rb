class CartsController < ApplicationController
  def show
    @cart = Cart.find(session[:cart_id]).cartships.joins(:product).group(:name,:unit_price).count
  end
end
