module Admins::ItemsHelper
	def sorted(object,col,direction: "ASC")
    result = object.sort { |a,b| a[col.to_sym] <=> b[col.to_sym] }
    result = result.reverse if direction == 'DESC'
    result
  end

  def save_key(key)
    white_list = %w[artist genre sales_status]
    str = request.fullpath.match(/(?<=&#{key}=)\d+(?=\&)/)
    if white_list.include?(key)
      eval("@sorted_#{key} ||= str ") # Ctrlにあれば代入しない
    end
  end

end
