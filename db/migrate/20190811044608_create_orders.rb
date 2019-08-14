class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.references :user, foreign_key: true
      t.string :user_name
      t.string :postal_code
      t.text :address
      t.string :telephone_number
      t.integer :payment, default: 3, null: false
      t.string :total_price
      t.string :subtotal_price
      t.string :carriage
      t.string :tax
      t.integer :delivery_status

      t.timestamps
    end
  end
end
