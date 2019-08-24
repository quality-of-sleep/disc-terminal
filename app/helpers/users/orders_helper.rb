module Users::OrdersHelper
	# フルネーム
	def full_name(user)
		user.last_name + user.first_name
	end

		# 小計(金額)
	def price_reckoning(carts)
		price = 0
		carts.each do |cart|
			price += cart.item.price * cart.amount
		end
		price
	end
	# 小計(購入数量)
	def total_amount(carts)
		amount = 0
		carts.each do |cart|
			amount += cart.amount
		end
		amount
	end

	# 消費税計算　BigDecimal=小数点計算, delimited=カンマ区切り
	def tax(price)
		((BigDecimal(price.to_s) * BigDecimal("0.08")).ceil).to_i
	end
	def subtotal_price(price)
		((BigDecimal(price.to_s) * BigDecimal("1.08")).ceil).to_i
	end
	def total_price(price,carriage)
		((BigDecimal(price.to_s) * BigDecimal("1.08") + BigDecimal(carriage.to_s)).ceil).to_i
	end
end

# 新規配送先登録
def new_address_create(address, params)
	address.recipient = params[:user_name]
	address.postal_code = params[:postal_code]
	address.details = params[:address]
	address.telephone_number = params[:telephone_number]
end

# indexソートhelper
def sortTh(sort_key,contName)
	if request.fullpath.include?('desc')
		if params[:delivery_status].present?
			link_to sort_key, sort: contName, delivery_status: @sort_key
		else
			link_to sort_key, sort: contName
		end
	else
		if params[:delivery_status].present?
			link_to sort_key, sort: "#{contName} desc", delivery_status: @sort_key
		else
			link_to sort_key, sort: "#{contName} desc"
		end
	end
end
