class Admins::AdminsController < ApplicationController
	before_action :authenticate_admin!

	def home
		render 'admins/home'
	end
end
