class Review < ApplicationRecord
  belongs_to :item
  belongs_to :user
  #descは下降順（大きい数から順番）by riyo
  default_scope -> { order(created_at: :desc) }

end
