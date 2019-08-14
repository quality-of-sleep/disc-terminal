module Users::CartsHelper
	# 購入数量プルダウンの処理
	def stock_array(stock)
		if stock.item.stock > 51
			return [[1,1], [2,2], [3,3], [4,4],[5,5], [6,6], [7,7], [8,8], [9,9], [10,10],
							[15,15], [20,20], [25,25], [30,30], [40,40], [50,50], [stock.item.stock,stock.item.stock]]
		elsif stock.item.stock >= 40
			return [[1,1], [2,2], [3,3], [4,4],[5,5], [6,6], [7,7], [8,8], [9,9], [10,10],
							[15,15], [20,20], [25,25], [30,30], [40,40]]
		elsif stock.item.stock >= 30
			return [[1,1], [2,2], [3,3], [4,4],[5,5], [6,6], [7,7], [8,8], [9,9], [10,10],
							[15,15], [20,20], [25,25], [30,30]]
		elsif stock.item.stock >= 25
			return [[1,1], [2,2], [3,3], [4,4],[5,5], [6,6], [7,7], [8,8], [9,9], [10,10],
							[15,15], [20,20], [25,25]]
		elsif stock.item.stock >= 20
			return [[1,1], [2,2], [3,3], [4,4],[5,5], [6,6], [7,7], [8,8], [9,9], [10,10],
							[15,15], [20,20]]
		elsif stock.item.stock >= 15
			return [[1,1], [2,2], [3,3], [4,4],[5,5], [6,6], [7,7], [8,8], [9,9], [10,10],
							[15,15]]
		elsif stock.item.stock >= 10
			return [[1,1], [2,2], [3,3], [4,4],[5,5], [6,6], [7,7], [8,8], [9,9], [10,10]]
		elsif stock.item.stock == 9
			return [[1,1], [2,2], [3,3], [4,4],[5,5], [6,6], [7,7], [8,8], [9,9]]
		elsif stock.item.stock == 8
			return [[1,1], [2,2], [3,3], [4,4],[5,5], [6,6], [7,7], [8,8]]
		elsif stock.item.stock == 7
			return [[1,1], [2,2], [3,3], [4,4],[5,5], [6,6], [7,7]]
		elsif stock.item.stock == 6
			return [[1,1], [2,2], [3,3], [4,4],[5,5], [6,6]]
		elsif stock.item.stock == 5
			return [[1,1], [2,2], [3,3], [4,4],[5,5]]
		elsif stock.item.stock == 4
			return [[1,1], [2,2], [3,3], [4,4]]
		elsif stock.item.stock == 3
			return [[1,1], [2,2], [3,3]]
		elsif stock.item.stock == 2
			return [[1,1], [2,2]]
		elsif stock.item.stock == 1
			return [[1,1]]
		else
			return [["在庫切れ",0]]
		end
	end
end
