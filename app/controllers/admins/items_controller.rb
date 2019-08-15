class Admins::ItemsController < ApplicationController
	# 実装中は便宜上コメントアウトしておく
#before_action :authenticate_admin!

	def index
		@artists = Artist.all
		@genres = Genre.all
		@items = Item.page(params[:page])
			@items = @items.search(key: 'name', value: params[:search]) if params[:search] != nil
		@items = @items.where(artist_id: params[:artist]) if params[:artist].present?
		@items = @items.where(genre_id: params[:genre]) if params[:genre].present?
		@items = @items.reorder("#{params[:key]} #{params[:direction]}")
	end
	def new
	end
	def create
	end
	def show
	end
	def edit
	end
	def update
	end

end
