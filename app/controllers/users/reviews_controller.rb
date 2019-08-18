class Users::ReviewsController < ApplicationController
	def new
#		p.8.5 新規投稿ページの表示
	end

	def create
		
	end

	def edit
#		p.9
	end

	def update
		
	end

	def destroy
		
	end

	def show
		@item = Item.find(params[:id])
		@user = current.user
		#特定のitemのreviewすべてを出したい。下記は間違いであると考えられる。
		@reviews = @item.review.all		
	end

	private
	def review_params
		params.require(:review).permit(:item_id,:user_id,:title,:body)
	end
end
