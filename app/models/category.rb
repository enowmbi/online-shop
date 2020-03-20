class Category < ApplicationRecord
  have_many :category_product_assignments,dependent: :destroy
  have_many :products, through: :category_product_assignment
end
