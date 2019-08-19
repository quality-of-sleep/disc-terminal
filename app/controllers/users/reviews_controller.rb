class Users::ReviewsController < ApplicationController
	#before_action :authenticate_user!, except: [:index]

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
		@item = Item.find(params[:id])
		@user = current.user
		#下記で、特定のitemのreviewすべてを出したい。
		@reviews = @item.review.all		
	end

	private
	def review_params
		params.require(:review).permit(:item_id, :user_id, :title, :body)
	end
end
