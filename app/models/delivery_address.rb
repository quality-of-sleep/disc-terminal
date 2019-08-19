class DeliveryAddress < ApplicationRecord
  belongs_to :user
  validates :postal_code, presence: true
  validates :details, presence: true
end
