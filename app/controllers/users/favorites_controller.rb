class Users::FavoritesController < ApplicationController
	#before_action :authenticate_user!

	def create
		item = Item.find(params[:item_id])
		favorite = current_user.favorites.new(item_id: item.id)
		favorite.save
		#下記は、元いたページに戻る。
		redirect_back(fallback_location: root_url)
	end

	def destroy
		item = Item.find(params[:item_id])
		
		if favorite = current_user.favorites.find_by(item_id: item.id)
			favorite.destroy
		end
		#ブラウザをリクエストしたページにリダイレクトする。それ以外の場合は、指定されたデフォルトのフォールバックにリダイレクト
		redirect_back(fallback_location: root_url)
	end
end
