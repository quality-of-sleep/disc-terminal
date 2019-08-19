class Users::DeliveryAddressesController < ApplicationController
	def new
		@delivery_address = DeliveryAddress.new
	end
	def create
		binding.pry
	end
	def delivery_address
		params.require(:delivery_address).permit(
																	:user_id,
																	:recipient,
																	:postal_code,
																	:details,
																	:telephone_number,
																	)
	end
end
