Rails.application.routes.draw do
  devise_for :admins # feature-devise-1
  devise_for :users # feature-devise-1
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
