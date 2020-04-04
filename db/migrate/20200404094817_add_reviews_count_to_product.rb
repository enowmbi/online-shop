class AddReviewsCountToProduct < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :reviews_count, :integer, null:false, default: 0

    up_only do 
      Product.find_each{|p| Product.reset_counters(p.id,:reviews)}
    end
  end
end
