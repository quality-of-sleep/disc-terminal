class Admins::OrdersController < ApplicationController
	include Users::OrdersHelper
	def index
		@orders = Order.page(params[:page]).reverse_order
	end
end
