class Users::UsersController < ApplicationController

  def show
  	@user = User.find(params[:id])
  end

  def edit
  	@user = User.find(params[:id])
    @delivery_address = @user.delivery_addresses.build
  end

  def update
  	user = User.find(params[:id])
  	user.update(user_params)
  	redirect_to users_user_path(user.id)
  end

  def withdrawal
   	@user = User.find(params[:id])
  end

  def quit
  	user = User.find(params[:id])
  	user.is_quit = true
  	user.save
  	redirect_to root_path
  end

	# tori_cart-test(カート機能試すときはコメントアウト外してください)
 	private
 	def user_params
 		params.require(:user).permit(:email, :last_name, :first_name, :last_name_kana, :first_name_kana, :telephone_number, :postal_code, :address, :payment, :is_quit, delivery_addresses_attributes: [:id, :recipient, :postal_code, :details, :telephone_number, :_destroy])
 	end
end
