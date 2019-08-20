module Users::ItemsHelper

	def sorted(object,col,direction)
    result = object.sort { |a,b| a[col.to_sym] <=> b[col.to_sym] }
    result = result.reverse if direction == 'DESC'
    result
  end

end
