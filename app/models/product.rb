class Product < ApplicationRecord
  has_one_attached :image

  def thumbnail
    return self.image.variant(resize: "200 x 175").processed
  end

end
