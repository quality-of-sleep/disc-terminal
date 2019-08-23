# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

   # POST /resource/sign_in
   def create
    user = User.find_by(email: params[:user][:email])
    if user.is_quit == "退会済み"
      flash[:alert] = "退会済みアカウントです"
      redirect_to root_path and return
    end
    super
   end

  # DELETE /resource/sign_out
   def destroy
    if current_user.is_quit == "退会済み"
      reset_session
      flash[:alert] = "退会手続きが完了しました"
      redirect_to root_path and return
    else
     super
    end
   end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
