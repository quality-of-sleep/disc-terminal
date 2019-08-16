class Item < ApplicationRecord
  belongs_to :artist
  belongs_to :genre
  belongs_to :label
  def favorited_by?(user)
          favorites.where(user_id: user.id).exists?
  end
end
