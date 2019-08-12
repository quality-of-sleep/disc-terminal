class Item < ApplicationRecord
  belongs_to :artist
  belongs_to :genre
  belongs_to :label




  # 一つの商品は複数のカートに入れられる
  has_many :carts
  # cart_test
  attachment :image
end
