class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.references :artist, foreign_key: true, default: 1, null: false
      t.references :genre, foreign_key: true, default: 1, null: false
      t.references :label, foreign_key: true, default: 1, null: false
      t.string :name, null: false
      t.integer :price, null: false
      t.integer :sales_status, null: false
      t.integer :stock, null: false
      t.string :image_id

      t.timestamps
    end
  end
end
