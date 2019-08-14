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
		@postal_code = "1500041" # 現住所
		@address = "東京都渋谷区神南1丁目19番11号パークウェースクエア2 4階"
		@telephone_number = "0368694700"

		@delivery_User_name = "海馬瀬人"# 配送先
		@delivery_postal_code = "5420076"
		@details = "大阪府大阪市中央区難波4丁目7-14難波フロントビル 4階"
		@delivery_telephone_number = "0452224444"

	end

	def create

		@user = current_user
		@order = Order.new(order_params)
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
