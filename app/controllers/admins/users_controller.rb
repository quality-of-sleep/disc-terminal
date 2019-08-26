class Admins::UsersController < ApplicationController
	before_action :authenticate_admin!
	def index
		@users = User.all
		@users = @users.reorder("#{params[:key]} #{params[:direction]}")if params[:key].present?
	  	@users = @users.where(["is_quit = ?", "#{params[:is_quit]}"]) if params[:is_quit].present?
      if params[:search].present?
		@users = @users.search(params[:search])
	  end
	end

	def show
	  	@user = User.find(params[:id])
	    @admin_comment = AdminComment.new
	end

    def quit
      user = User.find(params[:id])
  	  user.is_quit = true
  	  user.save
      redirect_to admins_users_path
    end

 	private
 	def user_params
 		params.require(:user).permit(:id, :email, :last_name, :first_name, :last_name_kana, :first_name_kana, :telephone_number, :postal_code, :address, :payment, :is_quit, delivery_addresses_attributes: [:id, :recipient, :postal_code, :details, :telephone_number, :_destroy], admin_comments_attributes: [:id, :body, :_destroy])
 	end
end

