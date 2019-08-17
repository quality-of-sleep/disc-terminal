class Item < ApplicationRecord
  belongs_to :artist
  belongs_to :genre
  belongs_to :label
  has_many :discs
  accepts_nested_attributes_for :discs # discs_attributesハッシュを生成



  # 一つの商品は複数のカートに入れられる
  has_many :carts
  # cart_test
  attachment :image

  enum sales_status:{ 編集中: 0, 在庫なし: 1, 販売停止中: 2, 販売中: 3 }
end
