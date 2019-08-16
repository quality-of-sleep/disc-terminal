class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.references :user, foreign_key: true
      t.string :user_name
      t.string :postal_code
      t.text :address
      t.string :telephone_number
      t.integer :payment, default: 3, null: false
      t.integer :total_price
      t.integer :subtotal_price
      t.integer :carriage
      t.integer :tax
      t.integer :delivery_status, default: 1, null: false

      t.timestamps
    end
  end
end
