class Admins::ReviewsController < ApplicationController
# 実装中は便宜上コメントアウトしておく
#before_action :authenticate_admin!

	def index
		@reviews = Review.page(params[:page]).search(target: params[:target], search: params[:search]).reorder("#{params[:key]} #{params[:direction]}")
	end
	def destroy

	end
end



