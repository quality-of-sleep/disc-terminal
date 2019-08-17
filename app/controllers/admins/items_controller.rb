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
		@artist = Artist.new
		@genre = Genre.new
		@label = Label.new
		@item = Item.new
			@disc = @item.discs.build # number
				@song = @disc.songs.build # number name

	end
	def create
		@artist = Artist.new(artist_params)
		@genre = Genre.new(genre_params)
		@label = Label.new(label_params)
		@item = Item.new(item_params)
		@item.artist = @artist
		@item.genre = @genre
		@item.label = @label
		@item.save
		render 'new'
		 debugger
		# artist = artist.create()
		# genre = genre.create()
		# label = label.create()

		# item = Item.create(artist: artist, genre_id: genre.id ...)
		# disc = Disc.new()
		# disc.item = item
		# disc.save
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
	  def item_params
	    params.require(:item).permit(:name, :price, :stock, :sales_status, :image,
	    			discs_attributes: [:id, :number],
	    			songs_attributes: [:id, :name, :number]
	    			)
	  end
end

