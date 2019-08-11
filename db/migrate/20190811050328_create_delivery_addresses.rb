class CreateDeliveryAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :delivery_addresses do |t|
      t.references :user, foreign_key: true
      t.text :recipient
      t.string :postal_code
      t.text :details
      t.string :telephone_number

      t.timestamps
    end
  end
end
