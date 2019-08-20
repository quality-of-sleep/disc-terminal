class DeliveryAddress < ApplicationRecord
  belongs_to :user
  validates :recipient, presence: true
  validates :postal_code, presence: true
  validates :details, presence: true
  validates :telephone_number, presence: true
end
