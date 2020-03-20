class DropCategoryProductAssignment < ActiveRecord::Migration[6.0]
  def change
    drop_table :category_product_assignments
  end
end
