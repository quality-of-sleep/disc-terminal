class Admins::AdminCommentsController < ApplicationController

	def create
		user = User.find(params[:user_id])
		admin_comment = user.admin_comments.new(admin_comment_params)
		admin_comment.save
		redirect_to admins_user_path(user)
	end


	def destroy
		user = User.find(params[:id])
		admin_comment = AdminComment.find_by(user_id: user.id)
		admin_comment.destroy
		redirect_to admins_user_path(user)
    end


    private
    def admin_comment_params
    	params.require(:admin_comment).permit(:user_id, :body)
    end
end
