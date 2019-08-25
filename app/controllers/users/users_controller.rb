class Users::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user

  def show
  	@user = User.find(params[:id])
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
    binding.pry
  	@user = User.find(params[:id])
  	if @user.update(user_params)
  	  redirect_to users_user_path(@user)
    else
      render 'edit'
    end
  end

  def withdrawal
   	@user = User.find(params[:id])
  end

  def quit
  	user = User.find(params[:id])
  	user.is_quit = true
  	user.save
    redirect_to users_logout_path
  end

	# tori_cart-test(カート機能試すときはコメントアウト外してください)
 	private
 	def user_params
 		params.require(:user).permit(:id, :email, :last_name, :first_name, :last_name_kana, :first_name_kana, :telephone_number, :postal_code, :address, :payment, :is_quit, delivery_addresses_attributes: [:id, :recipient, :postal_code, :details, :telephone_number, :_destroy])
 	end

  def ensure_correct_user
    if current_user.id != params[:id].to_i
      flash[:alert] = "アクセス権がありません"
      redirect_to root_path
    end
  end

end
