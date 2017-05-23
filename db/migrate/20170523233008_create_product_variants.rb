class CreateProductVariants < ActiveRecord::Migration[5.1]
  def change
    create_table :product_variants do |t|
      t.references :product, foreign_key: true, null: false
      t.string :name,      null: false
      t.string :remote_id, null: false
      t.string :sku,       null: false
      t.integer :inventory

      t.timestamps
    end
  end
end
