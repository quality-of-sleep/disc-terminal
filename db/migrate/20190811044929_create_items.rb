class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.references :artist, foreign_key: true
      t.references :genre, foreign_key: true
      t.references :label, foreign_key: true
      t.string :name
      t.integer :price
      t.integer :sales_status
      t.integer :stock
      t.string :image_id

      t.timestamps
    end
  end
end
