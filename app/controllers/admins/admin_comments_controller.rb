class Admins::AdminCommentsController < ApplicationController
	before_action :authenticate_admin!
	def create
		user = User.find(params[:user_id])
		@admin_comment = user.admin_comments.new(admin_comment_params)
		if @admin_comment.save
		  redirect_to admins_user_path(user)
		else
	       flash[:alert] = "コメントが入力されていません"
		   redirect_to admins_user_path(user)
		end
	end


	def destroy
		admin_comment = AdminComment.find(params[:id])
		@user = User.find(params[:user_id])
		admin_comment.destroy
		redirect_to admins_user_path(@user)
    end


    private
    def admin_comment_params
    	params.require(:admin_comment).permit(:user_id, :body)
    end
end
