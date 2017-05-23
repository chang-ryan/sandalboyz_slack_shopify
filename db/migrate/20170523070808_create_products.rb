class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :name,      null: false
      t.string :remote_id, null: false
      t.string :handle,    null: false

      t.timestamps
    end
  end
end
