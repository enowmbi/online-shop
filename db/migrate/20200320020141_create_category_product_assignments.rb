class CreateCategoryProductAssignments < ActiveRecord::Migration[6.0]
  def change
    create_table :category_product_assignments do |t|
      t.references :category, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
