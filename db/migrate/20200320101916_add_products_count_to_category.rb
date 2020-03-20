class AddProductsCountToCategory < ActiveRecord::Migration[6.0]
  def change
    add_column :categories, :products_count, :integer, default:0, null:false

    Category.find_each{|cat|Category.reset_counters(cat.id,:products)} 

  end
end
