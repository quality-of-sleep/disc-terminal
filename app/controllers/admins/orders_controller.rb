class Admins::OrdersController < ApplicationController
	include Users::OrdersHelper

	def index
		@orders = Order.page(params[:page]).reverse_order
	end

	def show
		@user = User.find(params[:user_id])
		@order = Order.find(params[:id])
		@discount = 0
		@total_amount = total_amount(@order.order_details)
	end
end
