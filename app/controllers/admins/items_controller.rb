class Admins::ItemsController < ApplicationController
	# 実装中は便宜上コメントアウトしておく
#before_action :authenticate_admin!

	def index
		@artists = Artist.all
		@genres = Genre.all
		@items = Item.page(params[:page])
		@items = @items.search(key: 'name', value: params[:search]) if params[:search] != nil # == !p.nil?
		@items = @items.where(["artist_id = ?","#{params[:artist]}"]) if params[:artist].present?
		@items = @items.where(["genre_id = ?", "#{params[:genre]}"]) if params[:genre].present?
		@items = @items.reorder(["?", "#{params[:key]} #{params[:direction]}"])

	end
	def new
		@artist = Artist.new
		@genre = Genre.new
		@label = Label.new
		@item = Item.new
		@disc = @item.discs.build
		@songs = @disc.songs.build

	end
	def create
		@artist = Artist.new(artist_params)
		@genre = Genre.new(genre_params)
		@label = Label.new(label_params)
		@item = Item.new(item_params)
		# チェックボックスをチェックしフォームを入力した場合のみ代入する
		@item.artist = @artist if params[:artist?] && params[:artist][:name]
		@item.genre = @genre if params[:genre?] && params[:genre][:name]
		@item.label = @label if params[:label?] && params[:label][:name]
		if @item.save
			render 'show'
			debugger
		else
			redirect_to new_admins_item_url
		end
	end
	def show
	end
	def edit
	end
	def update
	end

	private
		def artist_params
			params.require(:artist).permit(:name)
		end
		def genre_params
			params.require(:genre).permit(:name)
		end
		def label_params
			params.require(:label).permit(:name)
		end

		# nested_formによって生成された *_attributesも受け取る
	  def item_params
	    params.require(:item).permit(
	    	:name, :price, :stock, :sales_status, :image,
	    	:artist_id, :genre_id, :label_id,
				discs_attributes: [:id, :number, :_destroy,
	    		songs_attributes: [:id, :name, :number, :_destroy]
	    	]

	   	)
	  end

end


