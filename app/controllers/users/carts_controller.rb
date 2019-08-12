class Users::CartsController < ApplicationController
	def index
		@user = User.find(params[:user_id])
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
	end

	private
	def cart_params
		params.require(:cart).permit(:item_id, :user_id, :amount)
	end
end
