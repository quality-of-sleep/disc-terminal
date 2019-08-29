class Genre < ApplicationRecord
	has_many :items
	accepts_nested_attributes_for :items

	validates :name,
		presence:{ message: "ジャンルを指定してください" },
		uniqueness: { case_sensitive: false, message: "このジャンルは登録済みです" }
end
