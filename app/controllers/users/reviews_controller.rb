class Users::ReviewsController < ApplicationController
	before_action :authenticate_user!
	before_action :ensure_correct_user, only: [:edit, :update]
	def ensure_correct_user
		review = Review.find(params[:id])
    	if current_user.id != review.user.id
    		@item = Item.find(params[:item_id])
			redirect_to users_item_reviews_path(@item.id)
    	end
	end

	def new
		#p.8.5 新規投稿ページの表示
		@item = Item.find(params[:item_id])
		@review = Review.new
		@user = current_user
	end

	def create
		review = Review.new(review_params)
		review.user_id = current_user.id
		review.item = Item.find(params[:item_id])
		review.save
		@item = Item.find(params[:item_id])
		redirect_to users_item_reviews_path(@item.id)
	end

	def edit
		#p.9
		@review = Review.find(params[:id])
		@item = Item.find(params[:item_id])
	end

	def update
		review = Review.find(params[:id])
		review.user = current_user
		review.item = Item.find(params[:item_id])
		review.update(review_params)
		@item = Item.find(params[:item_id])
		render :index
	end

	def destroy
		review = Review.find(params[:id])
		review.destroy
		@item = Item.find(params[:item_id]) 
		redirect_to users_item_reviews_path(@item.id)
	end

	def index
		#p.8
		@item = Item.find(params[:item_id])
		@user = current_user
		#下記で、@item.review.allと何が違う？
		@reviews = @item.reviews
	end

	private
	def review_params
		params.require(:review).permit(
			:item_id,
			:user_id,
			:title, 
			:body
			)
	end
end