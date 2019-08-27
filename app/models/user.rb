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
  validates :email, presence: true
  enum is_quit:{利用中: false, 退会済み: true}
  enum payment:{クレジット支払: 1, 銀行振込: 2, 代金引換: 3}

  # 一人のユーザーは複数の商品をカートに入れられる
  has_many :carts, dependent: :destroy
  # 一人のユーザーは複数の注文履歴を持てる
  has_many :orders, dependent: :destroy
  has_many :delivery_addresses, dependent: :destroy
  accepts_nested_attributes_for :delivery_addresses, allow_destroy: true
  has_many :favorites, dependent: :destroy
  #try 8/22 18:13
  has_many :items, dependent: :destroy
  has_many :favorited_items, through: :favorites, source: :item

  has_many :reviews, dependent: :destroy
  has_many :admin_comments, dependent: :destroy
  accepts_nested_attributes_for :admin_comments, allow_destroy: true




  #validates :password, confirmation: true
  #or
  #validates_confirmation_of :password
  #attr_accessor :password_confirmation

  def self.search(search)
      return User.all unless search
      User.where([' last_name || first_name LIKE ? OR last_name_kana || first_name_kana LIKE ?', "%#{search}%",  "%#{search}%"])
  end
end
