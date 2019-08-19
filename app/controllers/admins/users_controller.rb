class Admins::UsersController < ApplicationController

	def index
		@users = User.all
	end


	def show
	  	@user = User.find(params[:id])
	end

    def quit
      user = User.find(params[:id])
  	  user.is_quit = true
  	  user.save
      redirect_to admins_users_path
    end

 	private
 	def user_params
 		params.require(:user).permit(:id, :email, :last_name, :first_name, :last_name_kana, :first_name_kana, :telephone_number, :postal_code, :address, :payment, :is_quit, delivery_addresses_attributes: [:id, :recipient, :postal_code, :details, :telephone_number, :_destroy], admin_comments_attributes: [:id, :body, :destroy])
 	end
end

