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
      flash[:danger] = "退会済みアカウントです"
      redirect_to root_path and return
    end
    super
   end

  # DELETE /resource/sign_out
  #退会処理後に"Sign out successfully"とは別のメッセージを表示するためには
  #通常ログアウトと退会処理後自動ログアウトの分岐を行う必要がある
   def destroy
  #この時点では通常ログアウトか退会処理後自動ログアウトか区別できない
    if current_user.is_quit == "退会済み"
      reset_session
  #現ログインユーザの退会ステータスが"退会済み"であれば、
  #セッション(現ログインユーザを特定するために一時的に保持している情報)をリセットする
  #その後下記のメッセージを表示する
      flash[:info] = "退会手続きが完了しました"
      redirect_to root_path and return
    else
     super
  #現ログインユーザの退会ステータスが"利用中"であれば、
  #通常ログアウトする->"Sign out successfully"を表示する
    end
   end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
