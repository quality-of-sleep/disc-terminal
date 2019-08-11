class Users::CartsController < ApplicationController
	def show
		user = User.find(params[:id])
	end

	def create

	end

	def update
	end

	# 詳細設計の漏れ
	def destroy
	end
end
