class Admins::OrdersController < ApplicationController
	include Users::OrdersHelper

	def index
		@orders = Order.page(params[:page]).reverse_order
	end

	def show
		@order = Order.find(params[:id])
		@discount = 0
		@total_amount = total_amount(@order.order_details)
	end

	def update
		order = Order.find(params[:id])
		order.update(order_params)
		redirect_back(fallback_location: root_url)
	end
	def order_params
		params.require(:order).permit(:delivery_status)
	end
end
