class Users::OrdersController < ApplicationController
	# helper呼び出し
	include Users::OrdersHelper

	before_action :authenticate_user!

	# URL直入力弾く
	before_action :ensure_correct_user, {only:[:new, :create, :index, :show]}
	def ensure_correct_user
		if current_user.id != params[:user_id].to_i
			redirect_to root_path
		end
	end

	def new
		@user = User.find(params[:user_id])
		@order = Order.new
		# 配送料, 割引
		@carriage = 500
		@discount = 0
		# 小計Helper
		@price = price_reckoning(@user.carts)
	end

	def create
		if params[:commit] == "登録"
			@user = current_user
			# 手動バリデーション分岐
			if params[:order][:user_name] != "" && params[:order][:postal_code] != "" && params[:order][:address] != "" && params[:order][:telephone_number] != ""
				new_address = @user.delivery_addresses.new
				# 住所登録ヘルパー
				new_address_create(new_address, params[:order])
				new_address.save
				flash[:success] = '新しい配送先を追加しました'
				redirect_to users_user_orders_new_path(@user)
			else
				@order = Order.new
				# 配送料, 割引
				@carriage = 500
				@discount = 0
				# 小計Helper
				@price = price_reckoning(@user.carts)
				flash[:danger] = '配送先の登録に失敗しました、情報は全て入力してください'
				render :action => 'new', :controller => 'users/orders', :user_id => @user.id
			end
		else
			user = current_user
			order = user.orders.new(order_params)
			# 現住所を選択するとaddressにcurrent_addressが入る様になっているのでそこで分岐
			if params[:order][:address] == "current_address"
				# 現住所選択
				order.user_name  = full_name(user)
				order.postal_code = user.postal_code
				order.address = user.address
				order.telephone_number = user.telephone_number
			else
				d_id = params[:order][:address].to_i - 1
				delivery = user.delivery_addresses[d_id]
				order.user_name = delivery.recipient
				order.postal_code = delivery.postal_code
				order.address = delivery.details
				order.telephone_number = delivery.telephone_number
			end
			# 計算
			# 配送料, 割引
			carriage = 500
			# 小計Helper
			price = price_reckoning(user.carts)             # 税別金額
			order.tax = tax(price)                          # 消費税helper
			order.subtotal_price = subtotal_price(price)    # 小計
			order.total_price = total_price(price,carriage) # 合計金額（税込
			order.carriage = carriage                       # 配送料
			order.save
			if params[:order][:payment] == "クレジット支払"
				Payjp.api_key = 'sk_test_b44f7f7725239fd573d01f8d'
			  Payjp::Charge.create(currency: 'jpy', amount: order.total_price, card: params['payjp-token'])
			end

			user.carts.each do |cart|
				order_details = order.order_details.new
				order_details.item_id = cart.item_id
				order_details.item_name = cart.item.name
				order_details.artist = cart.item.artist.name
				order_details.price = cart.item.price
				order_details.amount = cart.amount
				order_details.save
				cart.destroy
			end
			flash[:success] = "注文を確定しました、ご購入ありがとうございます"
			redirect_to users_user_order_path(user, order)
		end
	end

	def index
		@user = User.find(params[:user_id])
		@orders = @user.orders.page(params[:page]).reverse_order
	end

	def show
		@user = User.find(params[:user_id])
		@order = Order.find(params[:id])
		@discount = 0
	end

	def form
	end
	def update
	end

	private
	def order_params
		params.require(:order).permit(:user_id,:payment)
	end
end
