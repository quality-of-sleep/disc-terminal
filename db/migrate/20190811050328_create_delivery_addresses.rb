class CreateDeliveryAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :delivery_addresses do |t|
      t.references :user, foreign_key: true
      t.text :recipient, null: false
      t.string :postal_code, null: false
      t.text :details, null: false
      t.string :telephone_number, null: false

      t.timestamps
    end
  end
end
