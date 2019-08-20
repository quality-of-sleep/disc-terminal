class Review < ApplicationRecord
  belongs_to :item
  belongs_to :user
  #descは下降順（大きい数から順番)
  default_scope -> { order(created_at: :desc) }

  validates :title, presence: true
  validates :body, presence: true
end
