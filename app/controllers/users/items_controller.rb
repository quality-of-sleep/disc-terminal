class Users::ItemsController < ApplicationController
	PER = 20
	def index
		@items = Item.page(params[:page]).per(PER)
		@items = @items.search(key: 'name', value: params[:q]) if params[:q].present?
		@user = current_user
		@genres = Genre.all
		#@items = User.all.order(sort_column + ' ' + sort_direction)
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

 #	def sort_direction
  #  %w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"
  #end

  #def sort_column
   #   User.column_names.include?(params[:sort]) ? params[:sort] : "name"
  #end

end