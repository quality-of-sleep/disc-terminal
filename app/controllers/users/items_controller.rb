class Users::ItemsController < ApplicationController
	PER = 20
	def index	
		@items = Item.page(params[:page]).per(PER)
		@items = @items.search(key: 'name', value: params[:q]) if params[:q].present?
		@user = current_user
	end

	def show
		@item = Item.find(params[:id])
		@user = current_user
		@cart = Cart.new
	end

 	private
 	def item_params
 		params.require(:item).permit(:artist_id, :genre_id,	:label_id,
 			:name, :price, :sales_status, :stock, :image_id)
 	end
end