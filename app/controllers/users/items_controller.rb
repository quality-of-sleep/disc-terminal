class Users::ItemsController < ApplicationController












































	# tori_cart-test(カート機能試すときはコメントアウト外してください)
	def index
		@items = Item.all
	end
	def show
		@user = current_user
		@item = Item.find(params[:id])
		@cart = Cart.new
	end
	private
	def item_params
		params.require(:item).permit(
			:artist_id,
			:genre_id,
			:label_id,
			:name,
			:price,
			:sales_status,
			:stock)
	end
end
