class Users::CartsController < ApplicationController
	def show
		user = User.find(params[:id])
	end

	def create
		
users_user_cart GET    /users/users/:user_id/carts/:id(.:format)
	end

	def update
	end

	# 詳細設計の漏れ
	def destroy
	end
end
