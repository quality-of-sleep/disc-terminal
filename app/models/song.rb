class Song < ApplicationRecord
	belongs_to :disc
	validates :name, presence: { message: "1曲以上 曲名を入力してください" }
	validates :number, presence: true
end
