class Users::OrdersController < ApplicationController
	# helper呼び出し
	include Users::CartsHelper
	include Users::OrdersHelper

	def new
		@user = User.find(params[:user_id])
		@order = Order.new

		# 配送料, 割引
		@carriage = 500
		@discount = 0
		# 小計Helper
		price = price_reckoning(@user.carts) #税別金額
		@tax = tax(price) # 消費税helper
		@subtotal_price = on_tax_price(price) #小計
		@total_amount = total_amount(@user.carts) # 小計個数
		@total_price = total_price(price,@carriage)
		# インスタンス代入
		@order.tax = @tax
		@order.subtotal_price = @subtotal_price
		@order.total_price = @total_price
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

		# パラメータを上手く渡せないので仮設
		# 配送料, 割引
		carriage = 500
		# 小計Helper
		price = price_reckoning(user.carts) #税別金額
		order.tax = tax(price) # 消費税helper
		order.subtotal_price = on_tax_price(price) #小計
		order.total_price = total_price(price,carriage)
		order.carriage = carriage.to_s
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
