module Users::CartsHelper
	# 購入数量プルダウンの処理
	def stock_array(cart)
		if cart.item.stock > 51
			return [[cart.amount,cart.amount], [1,1], [2,2], [3,3], [4,4],[5,5], [6,6], [7,7], [8,8], [9,9], [10,10],
							[15,15], [20,20], [25,25], [30,30], [40,40], [50,50], [cart.item.stock,cart.item.stock]]
		elsif cart.item.stock >= 40
			return [[cart.amount,cart.amount],[1,1], [2,2], [3,3], [4,4],[5,5], [6,6], [7,7], [8,8], [9,9], [10,10],
							[15,15], [20,20], [25,25], [30,30], [40,40]]
		elsif cart.item.stock >= 30
			return [[cart.amount,cart.amount],[1,1], [2,2], [3,3], [4,4],[5,5], [6,6], [7,7], [8,8], [9,9], [10,10],
							[15,15], [20,20], [25,25], [30,30]]
		elsif cart.item.stock >= 25
			return [[cart.amount,cart.amount],[1,1], [2,2], [3,3], [4,4],[5,5], [6,6], [7,7], [8,8], [9,9], [10,10],
							[15,15], [20,20], [25,25]]
		elsif cart.item.stock >= 20
			return [[cart.amount,cart.amount],[1,1], [2,2], [3,3], [4,4],[5,5], [6,6], [7,7], [8,8], [9,9], [10,10],
							[15,15], [20,20]]
		elsif cart.item.stock >= 15
			return [[cart.amount,cart.amount],[1,1], [2,2], [3,3], [4,4],[5,5], [6,6], [7,7], [8,8], [9,9], [10,10],
							[15,15]]
		elsif cart.item.stock >= 10
			return [[cart.amount,cart.amount],[1,1], [2,2], [3,3], [4,4],[5,5], [6,6], [7,7], [8,8], [9,9], [10,10]]
		elsif cart.item.stock == 9
			return [[cart.amount,cart.amount],[1,1], [2,2], [3,3], [4,4],[5,5], [6,6], [7,7], [8,8], [9,9]]
		elsif cart.item.stock == 8
			return [[cart.amount,cart.amount],[1,1], [2,2], [3,3], [4,4],[5,5], [6,6], [7,7], [8,8]]
		elsif cart.item.stock == 7
			return [[cart.amount,cart.amount],[1,1], [2,2], [3,3], [4,4],[5,5], [6,6], [7,7]]
		elsif cart.item.stock == 6
			return [[cart.amount,cart.amount],[1,1], [2,2], [3,3], [4,4],[5,5], [6,6]]
		elsif cart.item.stock == 5
			return [[cart.amount,cart.amount],[1,1], [2,2], [3,3], [4,4],[5,5]]
		elsif cart.item.stock == 4
			return [[cart.amount,cart.amount],[1,1], [2,2], [3,3], [4,4]]
		elsif cart.item.stock == 3
			return [[cart.amount,cart.amount],[1,1], [2,2], [3,3]]
		elsif cart.item.stock == 2
			return [[cart.amount,cart.amount],[1,1], [2,2]]
		elsif cart.item.stock == 1
			return [[1,1]]
		else
			return [["在庫切れ",0]]
		end
	end

	def sales_status?(carts)
		carts.each do |cart|
			if cart.item.sales_status != "販売中"
				return false
			end
		end
	end

	def have_stocks?(carts)
		carts.each do |cart|
			if cart.item.stock < cart.amount
				return false
			end
		end
	end

	def have_stock?(stock, amount)
		if stock < amount
			return false
		end
	end

end
