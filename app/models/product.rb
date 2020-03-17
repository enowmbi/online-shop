class Product < ApplicationRecord
  has_one_attached :image
  has_many :cartships
  has_many :carts, through: :cartship

  def thumbnail
    return self.image.variant(resize: "200 x 175").processed
  end

end
