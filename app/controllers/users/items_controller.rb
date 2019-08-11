class Users::ItemsController < ApplicationController
	def index
		@items = Item.all
	end
	def show
		@item = Item.find(params[:id])
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
