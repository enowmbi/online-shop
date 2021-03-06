class Product < ApplicationRecord
  has_one_attached :image
  has_many :cartships
  has_many :carts, through: :cartship
  belongs_to :category, counter_cache: true
  has_many :reviews

  def thumbnail
    return self.image.variant(resize: "200 x 175").processed
  end

  def medium
    return self.image.variant(resize: "400 x 375").processed
  end

  def large
    return self.image.variant(resize: "600 x 575").processed
  end

  def allow_user_review?(user)
    return true if Review.where(product_id: self.id, user_id: user.id).blank?
  end

  def average_rating
    reviews = self.reviews
    if reviews.blank?
      return 0
    else
      return reviews.average(:rating).round(2)
    end
  end

end
