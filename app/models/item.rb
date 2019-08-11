class Item < ApplicationRecord
  belongs_to :artist
  belongs_to :genre
  belongs_to :label
end
