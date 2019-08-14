class Users::OrdersController < ApplicationController
	# carts_helper呼び出し
	include Users::CartsHelper

	def new
		@user = User.find(params[:user_id])
		@order = Order.new
		@cart = Cart.new
		# 小計Helper
		price = price_reckoning(@user.carts)
		# 小計消費税helper
		@tax = tax(price)
		@total_price = on_tax_price(price)
		# 小計個数helper
		@total_amount = total_amount(@user.carts)
	end

	def create
		
	end
end
