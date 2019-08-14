class Review < ApplicationRecord
  belongs_to :item
  belongs_to :user
  default_scope -> { order(created_at: :desc) }

  #def self.search(search)
  def self.search(target: "id", search: "0")
  	# 条件に合致するデータを探して出力する
  	# if search
  	# 	self.where(["user_id LIKE ?", "#{search}"])
  	if ( result = self.where(["#{target} LIKE ?", "#{search}"]) ).any?
  		result
  	else
  		self.all
  	end
  end
  # def self.sort(key,direction)
  # 	self.all.order(key: "#{direction}")
  # end

end
