class Cart < ApplicationRecord
  belongs_to :user
  has_many :cartships
  has_many :products, through: :cartships
end
