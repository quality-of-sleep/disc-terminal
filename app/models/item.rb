class Item < ApplicationRecord
  belongs_to :artist
  belongs_to :genre
  belongs_to :label
  has_many :favorites, dependent: :destroy
  has_many :reviews, dependent: :destroy
  def favorited_by?(user)
          favorites.where(user_id: user).exists?
  end

  has_many :discs

  # 一つの商品は複数のカートに入れられる
  has_many :carts
  # cart_test
  attachment :image
end
