class Disc < ApplicationRecord
	has_many :songs
  accepts_nested_attributes_for :songs # songs_attributesハッシュを生成
end
