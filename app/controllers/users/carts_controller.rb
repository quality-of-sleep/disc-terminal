class Users::CartsController < ApplicationController
	def index
		@user = User.find(params[:user_id])
		# 式は後でモデルに移る予定です
		price = 0
		@user.carts.each do |cart|
			price += cart.item.price
		end
		# BigDecimal=小数点計算, delimited=カンマ区切り
		@tax = ((BigDecimal(price.to_s) * BigDecimal("0.08")).ceil).to_s(:delimited)
		@total_price = ((BigDecimal(price.to_s) * BigDecimal("1.08")).ceil).to_s(:delimited)
	end

	def create
		cart = Cart.new
		item = Item.find(params[:item_id])
		user = User.find(params[:user_id])
		cart.user_id = user.id
		cart.item_id = item.id
		cart.amount = 1
		cart.save
		redirect_to users_user_carts_path(user.id)
	end

	def update
	end

	# 詳細設計の漏れ
	def destroy
		cart = Cart.find(params[:id])
		cart.destroy
		redirect_back(fallback_location: root_path)
	end

	private
	def cart_params
		params.require(:cart).permit(:item_id, :user_id, :amount)
	end
end
