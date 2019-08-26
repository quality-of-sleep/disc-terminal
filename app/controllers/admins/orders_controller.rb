class Admins::OrdersController < ApplicationController
	before_action :authenticate_admin!
	include Users::OrdersHelper

	def index
		# ページネーション使用したら分岐
		if params[:page].present?
			# ソートしつつページネーションしたら分岐
			if params[:sort].present?
				@orders = Order.page(params[:page])
			else
				@orders = Order.page(params[:page]).reverse_order
			end
			# 絞り込み分岐
			if params[:delivery_status].present?
				@orders = @orders.get_by_delivery_status params[:delivery_status]
				# 絞り込みパラメータ保持
				@sort_key = @orders.first.delivery_status
			end

			respond_to do |format|
	      format.html
	      format.js
	    end
		else
			# ページング＋ソート＋デフォルト降順
			@orders = Order.page.order(params[:sort]).reverse_order
			# 絞り込み分岐
			if params[:delivery_status].present?
				@orders = @orders.get_by_delivery_status params[:delivery_status]
				# 絞り込みパラメータ保持
				@sort_key = @orders.first.delivery_status
			end

			respond_to do |format|
	      format.html
	      format.js
	    end
		end
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
