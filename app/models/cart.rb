class Cart < ApplicationRecord
  belongs_to :user
  has_many :cartships
  has_many :products, through: :cartships

  def total_price
    cartships.map{|cartship| cartship.quantity * cartship.product.price}.sum
  end

end
