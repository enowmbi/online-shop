class Review < ApplicationRecord
  belongs_to :user
  belongs_to :product,counter_cache: true

  validates :user_id, uniqueness: {scope: :product_id,message: "You are entitled to only one review per product"}

end
