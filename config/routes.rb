Rails.application.routes.draw do
	root 'items#index'
  devise_for :admins # feature-devise-1
  devise_for :users # feature-devise-1
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :users do
  	resources :users ,only:[:show, :edit, :update] do
  		resources :delivery_addresses, only:[:create, :update, :destroy]
  		resources :carts, only:[:create,:show,:update]
  		resources :orders, only:[:index, :new, :create, :show]
  	end
  	get '/users/:id/withdrawal', to: 'users#withdrawal'
  	patch '/users/:id', to: 'users#quit'
  		resources :items, only:[:show] do
	  		resources :favorites, only:[:create, :destroy]
	  		resources :reviews, except:[:index]
	  	end
  end
  namespace :adimins ,only:[:index, :show] do
  	get '', to:'admins#home'
  	resources :users do
  		resources :admin_comments, only:[:create, :destroy]
  	end
  	patch '/users/:id', to: 'users#quit'
  	resources :orders, only:[:index, :show, :update]
  	resources :reviews, only:[:index, :destroy]
  	resources :items, except:[:destroy]
  	resources :artists, only:[:create]
  	resources :genres, only:[:create]
  	resources :labels, only:[:create]
  end

end
