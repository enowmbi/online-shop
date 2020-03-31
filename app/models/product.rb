class Product < ApplicationRecord
  has_one_attached :image
  has_many :cartships
  has_many :carts, through: :cartship
  belongs_to :category, counter_cache: true
  has_many :reviews

  def thumbnail
    return self.image.variant(resize: "200 x 175").processed
  end

end
