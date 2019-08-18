class Item < ApplicationRecord
  belongs_to :artist
  belongs_to :genre
  belongs_to :label
	def favorited_by?(user)
          favorites.where(user_id: user.id).exists?
  end
  has_many :discs, inverse_of: :item
  accepts_nested_attributes_for :discs, allow_destroy: true

  # 一つの商品は複数のカートに入れられる
  has_many :carts
  # cart_test
  attachment :image

  enum sales_status:{ 編集中: 0, 在庫なし: 1, 販売停止中: 2, 販売中: 3 }
end
