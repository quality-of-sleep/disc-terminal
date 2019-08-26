class Label < ApplicationRecord
	has_many :items
	accepts_nested_attributes_for :items

	validates :name,
		presence: { message: "レーベルを指定してください" },
		uniqueness: { case_sensitive: false, message: "このレーベルは登録済みです" }
end
