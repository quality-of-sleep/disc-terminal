class Disc < ApplicationRecord
	belongs_to :item
	has_many :songs
	has_many :songs, inverse_of: :disc
	belongs_to :item
  accepts_nested_attributes_for :songs, allow_destroy: true
end
