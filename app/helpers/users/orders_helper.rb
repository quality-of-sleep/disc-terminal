module Users::OrdersHelper
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
	def on_tax_price(price)
		((BigDecimal(price.to_s) * BigDecimal("1.08")).ceil).to_i
	end
	def total_price(price,carriage)
		((BigDecimal(price.to_s) * BigDecimal("1.08") + BigDecimal(carriage.to_s)).ceil).to_i
	end
end

# .to_s(:delimited)
