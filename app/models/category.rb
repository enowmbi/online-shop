class Category < ApplicationRecord
  has_many :category_product_assignments,dependent: :destroy
  has_many :products, through: :category_product_assignment
end
