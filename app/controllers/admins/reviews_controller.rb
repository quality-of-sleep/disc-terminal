class Admins::ReviewsController < ApplicationController
before_action :authenticate_admin!

	def index
		@reviews = Review.all
	end
	def destroy

	end
end
