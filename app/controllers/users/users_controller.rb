class Users::UsersController < ApplicationController

  def show
  	@user = User.find(params[:id])
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
  	user = User.find(params[:id])
  	user.update(user_params)
  	redirect_to users_user_path(user.id)
  end


  def withdrawal
  end

  def quit
  end

	# tori_cart-test(カート機能試すときはコメントアウト外してください)
 	private
 	def user_params
 		params.require(:user).permit(:email, :last_name, :first_name, :last_name_kana, :first_name_kana, :telephone_number, :postal_code, :address, :payment)
 	end
end
