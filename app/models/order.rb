class Order < ApplicationRecord
  belongs_to :user
  # 一人の注文履歴は複数の商品詳細を持つ
  has_many :order_details

  enum payment:{クレジット支払: 1, 銀行振込: 2, 代金引換: 3}
  enum delivery_status:{配送準備中: 1, 配送中: 2, 配送済: 3, キャンセル: 4}

  scope :get_by_delivery_status, ->(delivery_status) {
  																	where(delivery_status: delivery_status)
  																	}
end
