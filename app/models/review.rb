class Review < ApplicationRecord
  belongs_to :item
  belongs_to :user
  default_scope -> { order(created_at: :desc) }

end
