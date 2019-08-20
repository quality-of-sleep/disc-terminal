class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.references :user, foreign_key: true
      t.string :user_name, null: false
      t.string :postal_code, null: false
      t.text :address, null: false
      t.string :telephone_number, null: false
      t.integer :payment, default: 3, null: false
      t.integer :total_price, null: false
      t.integer :subtotal_price, null: false
      t.integer :carriage, null: false
      t.integer :tax, null: false
      t.integer :delivery_status, default: 1, null: false

      t.timestamps
    end
  end
end
