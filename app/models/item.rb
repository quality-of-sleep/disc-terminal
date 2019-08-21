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

  validates :name,
      presence: { message: "商品名を入力してください" },
      uniqueness: { case_sensitive: false, message: "この商品名は登録済みです" }
  validates :price, presence: { message: "価格を入力してください" }
  validates :sales_status, presence: true
  validates :stock, presence: { message: "在庫数を入力してください" }



  def favorited_by?(user)
          favorites.where(user_id: user).exists?
  end

end

