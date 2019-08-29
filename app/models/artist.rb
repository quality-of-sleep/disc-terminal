class Artist < ApplicationRecord
	has_many :items
	accepts_nested_attributes_for :items

	validates :name,
		presence: { message: "このアーティストは登録済みです" },
		uniqueness: { case_sensitive: false, message: "このアーティストは登録済みです" }
end
