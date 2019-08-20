class Artist < ApplicationRecord
	has_many :items
	accepts_nested_attributes_for :items

	validates :name, presence: true, uniqueness: { case_sensitive: false }
end
