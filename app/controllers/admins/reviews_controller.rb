class Admins::ReviewsController < ApplicationController
# 実装中は便宜上コメントアウトしておく
#before_action :authenticate_admin!

	def index
		@reviews = Review.page(params[:page])
		if !params[:target].nil?
			@reviews = @reviews.search(key: params[:target], value: params[:search])
		elsif !params[:key].nil?
			@reviews = @reviews.reorder("#{params[:key]} #{params[:direction]}")
		end
	end
	def destroy
		review = Review.find(params[:id])
		review.destroy
    flash[:success] = "Review deleted"
    redirect_to request.referrer || admins_reviews_url
	end
end



