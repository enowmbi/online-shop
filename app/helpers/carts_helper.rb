module CartsHelper
  def get_product_name(cartship)
    cartship[0][0] 
  end

  def get_product_quantity(cartship)
    cartship[1] 
  end

  def get_product_unit_price(cartship)
    number_to_currency(cartship[0][1]) 
  end

  def get_extended_product_price(cartship)
    number_to_currency(cartship[1] * cartship[0][1])
  end

  def get_total_amount_to_pay
    number_to_currency(@cart.map{|cartship| cartship[0][1] * cartship[1] }.sum)
  end
end
