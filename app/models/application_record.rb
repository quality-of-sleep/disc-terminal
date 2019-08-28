class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  # 条件に合致するデータを探して出力する
  def self.search(key: "id", value: "0")
  	if ( result = self.where(["#{key} LIKE ?", "%#{value}%"]) ).any?
  		result
		else
			self.all
  	end
  end


end
