class Users::OrdersController < ApplicationController
	# carts_helper呼び出し
	include Users::CartsHelper

	def new
		@user = User.find(params[:user_id])
		@order = Order.new

		# 小計Helper
		price = price_reckoning(@user.carts)
		# 小計消費税helper
		@tax = tax(price)
		@total_price = on_tax_price(price)
		# 小計個数helper
		@total_amount = total_amount(@user.carts)

		# テスト用コード
		@cart = Cart.new
	end

	def create
		user = current_user
		order = user.orders.new(order_params)
		# 配送先登録
		d_id = order.address.to_i - 1
		delivery = user.delivery_addresses[d_id]
		order.user_name = delivery.recipient
		order.postal_code = delivery.postal_code
		order.address = delivery.details
		order.telephone_number = delivery.telephone_number
		binding.pry
	end

	private
	def order_params
		params.require(:order).permit(:user_id,
																	:user_name,
																	:postal_code,
																	:address,
																	:telephone_number,
																	:payment,
																	:total_price,
																	:subtotal_price,
																	:carriage,
																	:tax,
																	:delivery_status)
	end
end
