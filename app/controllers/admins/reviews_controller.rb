class Admins::ReviewsController < ApplicationController
	before_action :authenticate_admin!

	def index
		@reviews = Review.page(params[:page])
		if !params[:target].nil?
			@reviews = @reviews.search(key: params[:target], value: params[:search])
		elsif !params[:key].nil?
			@reviews = @reviews.reorder("#{params[:key]} #{params[:direction]}")
		end
	end
	def update
		review = Review.find(params[:id])
		review.title = review.body = '管理者により削除されました'
    if review.save
    	flash[:warning] = "レビュー内容を削除しました"
    	redirect_to request.referrer || admins_reviews_url
    end
	end
	def destroy
		review = Review.find(params[:id])
		if review.destroy
			flash[:danger] = "レビューを削除しました"
    	redirect_to request.referrer || admins_reviews_url
    end
	end

end
