module Users::CartsHelper
	def stock_array(stock)
		[[">#{stock.amount}",stock.amount],[1,1], [2,2], [3,3], [4,4], [5,5]]
	end
end
