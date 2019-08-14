class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # 一人のユーザーは複数の商品をカートに入れられる
  has_many :carts, dependent: :destroy
  # 一人のユーザーは複数の注文履歴を持てる
  has_many :orders, dependent: :destroy
end
