class CreateCartships < ActiveRecord::Migration[6.0]
  def change
    create_table :cartships do |t|
      t.references :cart, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.integer :quantity

      t.timestamps
    end
  end
end
