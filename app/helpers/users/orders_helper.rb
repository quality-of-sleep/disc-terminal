module Users::OrdersHelper
	def total_price(price,carriage)
		((BigDecimal(price.to_s) * BigDecimal("1.08") + BigDecimal(carriage.to_s)).ceil).to_s(:delimited)
	end
end
