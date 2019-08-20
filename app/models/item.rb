class Item < ApplicationRecord
  belongs_to :artist
  belongs_to :genre
  belongs_to :label
  # 一つの商品は複数のカートに入れられる
  has_many :carts
  has_many :favorites, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :discs, inverse_of: :item
  accepts_nested_attributes_for :discs, allow_destroy: true

  attachment :image

  enum sales_status:{ 編集中: 0, 在庫なし: 1, 販売停止中: 2, 販売中: 3 }

  validates :name, presence: true
  validates :price, presence: true
  validates :sales_status, presence: true
  validates :name, presence: true
  validates :name, presence: true
  validates :stock, presence: true



  def favorited_by?(user)
          favorites.where(user_id: user).exists?
  end

end

