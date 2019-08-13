class Order < ApplicationRecord
  belongs_to :user
  # 一人の注文履歴は複数の商品詳細を持つ
  has_many :order_details
end
