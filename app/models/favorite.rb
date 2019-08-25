class Favorite < ApplicationRecord
  belongs_to :item
  belongs_to :user

#try 8/22 18:13
	validates_uniqueness_of :item_id, scope: :user_id
end
