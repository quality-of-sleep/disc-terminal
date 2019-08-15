class Users::ItemsController < ApplicationController
	def index
		@items =Item.all
		@artists = Artist.all
		@jenres = Jenre.all
	end

	def show
		
	end
end
