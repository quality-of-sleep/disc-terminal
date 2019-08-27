class Admins::ItemsController < ApplicationController
	before_action :authenticate_admin!

	def index
		@artists = Artist.all
		@genres = Genre.all
 		@items = Item.page(params[:page])
		@items = @items.search(key: 'name', value: params[:search]) if params[:search].present?
		@items = @items.where(["artist_id = ?","#{params[:artist]}"]) if params[:artist].present?
		@items = @items.where(["genre_id = ?", "#{params[:genre]}"]) if params[:genre].present?
		@items = @items.where(["sales_status = ?", "#{params[:sales_status]}"]) if params[:sales_status].present?
		@sorted_artist ||= params[:artist] #key_regexにより生成
		@sorted_genre = params[:genre]
		@sorted_sales_status = params[:sales_status]
		if params[:key].present?
			@items ||= @items.reorder("#{params[:key]} #{params[:direction]}")
			@sort = sorted( @items, params[:key],params[:direction] )
			@items = Kaminari.paginate_array(@sort).page(params[:page]).per(25)
		end

		if params[:sales_status?]
			@item = Item.find_by(id: params[:id])
			@item.sales_status = params[:sales_status?].to_i
			@item.save
			respond_to do |format|
				format.html { redirect_back(fallback_location: admins_items_url) }
				format.js{ redirect_back(fallback_location: admins_items_url) }
			end
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
		@item = Item.new(item_params)
		# チェックボックスをチェックしフォームを入力した場合のみ代入する
		if params[:artist?] && params[:artist][:name].present?
			@item.artist = Artist.new(artist_params)
		end
		if params[:genre?] && params[:genre][:name].present?
			@item.genre = Genre.new(genre_params)
		end
		if params[:label?] && params[:label][:name].present?
			@item.label = Label.new(label_params)
		end
		if @item.save
			flash[:success] = '商品を追加しました'
			redirect_to [:admins, @item]
		else
			render 'new'
		end
	end
	def show
		@item = Item.find(params[:id])
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
		@item = Item.find(params[:id])
		@item.update(item_params)
		if params[:artist?] && params[:artist][:name].present?
			@item.artist = Artist.new(artist_params)
		end
		if params[:genre?] && params[:genre][:name].present?
			@item.genre = Genre.new(genre_params)
		end
		if params[:label?] && params[:label][:name].present?
			@item.label = Label.new(label_params)
		end
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
				discs_attributes: [
					:id, :number, :_destroy,
	    		songs_attributes: [
						:id, :name, :number, :_destroy
					]
	    	]
	   	)
	  end
end
