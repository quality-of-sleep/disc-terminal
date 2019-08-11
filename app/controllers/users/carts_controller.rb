class Users::CartsController < ApplicationController
	def show
		user = User.find(params[:id])
	end

	def create
		user = User.find(params[:id])
		cart = user.carts

	end
users_user_carts GET    /users/users/:user_id/carts(.:format)
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
