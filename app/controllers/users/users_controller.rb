class Users::UsersController < ApplicationController

  def withdrawal
  end






















	# tori_cart-test(カート機能試すときはコメントアウト外してください)
 	private
 	def user_params
 		params.require(:user).permit(:email)
 	end
end
