module Admins::ItemsHelper
	def sorted(object,col,direction: "ASC")
    result = object.sort { |a,b| a[col.to_sym] <=> b[col.to_sym] }
    result = result.reverse if direction == 'DESC'
    result
  end

  def key_regex(key)
    str = request.fullpath.match(/(?<=&#{key}=)\d+(?=\&)/)
    if ( eval("@sorted_#{key} ||= str ") ) # Ctrlにあれば代入しない
      eval("@sorted_#{key}") # [0]不要
    end
  end

end
