class Admins::ItemsController < ApplicationController
	before_action :authenticate_admin!

	def index
		@artists = Artist.all
		@genres = Genre.all
 		@items = Item.page(params[:page])

		@items = @items.search(key: 'name', value: params[:search]) if params[:search].present?
		@items = @items.where(["artist_id = ?","#{params[:artist]}"]) if params[:artist].present?
		@items = @items.where(["genre_id = ?", "#{params[:genre]}"]) if params[:genre].present?
		if params[:key].present?
			items = sorted( @items, params[:key],params[:direction] )
 			@items = Kaminari.paginate_array(items).page(params[:page]).per(25)
 		end

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
			flash[:success] = '商品を追加しました'
			render 'new'
		else
			render 'new'
		end
	end
	def show
	end
	def edit
		@artist = Artist.new
		@genre = Genre.new
		@label = Label.new
		@item = Item.find(params[:id])
		@discs = @item.discs do|disc|
			@songs = disc.songs {|song|}
		end
	end
	def update
		@artist = Artist.new(artist_params)
		@genre = Genre.new(genre_params)
		@label = Label.new(label_params)
		@item = Item.find(params[:id])
		@item.update(item_params)
		@item.artist = @artist if params[:artist?] && params[:artist][:name]
		@item.genre = @genre if params[:genre?] && params[:genre][:name]
		@item.label = @label if params[:label?] && params[:label][:name]
		if @item.save
			flash[:success] = '商品を編集しました'
			redirect_to [:admins, @item]
		else
			render 'edit'
		end
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


