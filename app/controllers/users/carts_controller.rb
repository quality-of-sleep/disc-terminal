class Users::CartsController < ApplicationController
	# carts_helper呼び出し
	include Users::CartsHelper
	before_action :authenticate_user!
	# URL直入力弾く
	before_action :ensure_correct_user
	def ensure_correct_user
		if current_user.id != params[:user_id].to_i
			redirect_to root_path
		end
	end

	def index
		@user = User.find(params[:user_id])
		# 小計Helper
		price = price_reckoning(@user.carts)
		# 小計消費税helper
		@tax = tax(price)
		@total_price = on_tax_price(price)
		# 小計個数helper
		@total_amount = total_amount(@user.carts)
	end

	def create
		cart = Cart.new
		item = Item.find(params[:item_id])
		user = User.find(params[:user_id])
		cart.user_id = user.id
		cart.item_id = item.id
		cart.amount = 1
		cart.save
		flash[:success] = "商品をカートに追加しました"
		redirect_to users_user_carts_path(user.id)
	end

	def update
		cart = Cart.find(params[:id])
		cart.amount = params[:amount]
		cart.save
		flash[:success] = "購入数量を変更しました"
		redirect_to users_user_carts_path(current_user.id)
	end

	def destroy
		cart = Cart.find(params[:id])
		cart.destroy
		flash[:danger] = "商品をカートから削除しました"
		redirect_back(fallback_location: root_path)
	end

	private
	def cart_params
		params.require(:cart).permit(:item_id, :user_id, :amount)
	end
end
