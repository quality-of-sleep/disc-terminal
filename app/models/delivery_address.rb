class DeliveryAddress < ApplicationRecord
  belongs_to :user

 with_options if: :all_columns_presences_are_true? do
  validates :recipient, presence: true
  validates :postal_code, presence: true
  validates :details, presence: true
  validates :telephone_number, presence: true
  end

 def all_columns_presences_are_true?
   recipient.presence or postal_code.presence or details.presence or telephone_number.presence == true
 end

end
