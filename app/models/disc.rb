class Disc < ApplicationRecord
	belongs_to :item
	has_many :songs, inverse_of: :disc
  accepts_nested_attributes_for :songs, allow_destroy: true

  validates :number, presence: { message: "ディスクが指定されていません" }
end
