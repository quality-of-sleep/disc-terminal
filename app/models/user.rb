class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :last_name_kana, presence: true
  validates :first_name_kana, presence: true
  validates :postal_code, presence: true
  validates :address, presence: true
  validates :telephone_number, presence: true
  enum payment:{クレジット支払: 1, 銀行振込: 2, 代金引換: 3}

  # 一人のユーザーは複数の商品をカートに入れられる
  has_many :carts, dependent: :destroy
  # 一人のユーザーは複数の注文履歴を持てる
  has_many :orders, dependent: :destroy
  has_many :delivery_addresses, dependent: :destroy
  accepts_nested_attributes_for :delivery_addresses, allow_destroy: true
  has_many :favorites, dependent: :destroy
  has_many :reviews, dependent: :destroy
end
