class Order < ApplicationRecord
  belongs_to :user
  # 一人の注文履歴は複数の商品詳細を持つ
  has_many :order_details

  enum payment:{クレジット支払: 1, 銀行振込: 2, 代金引換: 3}
end
