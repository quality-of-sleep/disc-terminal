class Users::ReviewsController < ApplicationController
	def new
		#p.8.5 新規投稿ページの表示
	end

	def create
		
	end

	def edit
		#p.9
	end

	def update
		
	end

	def destroy
		
	end

	def index
		@item = Item.find(params[:item_id])
		@user = current_user
		#下記で、@item.review.allと何が違う？
		@reviews = @item.reviews
	end

	private
	def review_params
		params.require(:review).permit(:item_id, :user_id, :title, :body)
	end
end