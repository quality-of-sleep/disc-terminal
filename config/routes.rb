Rails.application.routes.draw do
	root 'users/items#index'
  devise_for :admins # feature-devise-1
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
devise_for :users, controllers: {
  sessions:      'users/sessions',
  #passwords:     'users/passwords',
  #registrations: 'users/registrations'
}


namespace :users do
  devise_scope :user do
    get '/logout', to: 'sessions#destroy'
  end
end

# 新規住所フォームキャンセル時のルーティング
delete "delete_form" => "users/orders#destroy"


  namespace :users do
  	resources :users ,only:[:show, :edit, :update] do
  		resources :delivery_addresses, only:[:create, :update, :destroy]
  		resources :carts, only:[:create,:index,:update, :destroy]
      get '/orders/buy' => 'orders#new', as: 'orders_new'
  		resources :orders, only:[:index, :create, :show]
  	end
  	get '/users/:id/withdrawal', to: 'users#withdrawal'
  	patch '/users/:id/withdrawal', to: 'users#quit'
  		resources :items, only:[:show] do
	  		resources :favorites, only:[:create, :destroy]
	  		resources :reviews, except:[:show]
	  	end
  end

  namespace :admins ,only:[:index, :show] do
  	get '', to:'admins#home'
  	resources :users do
  		resources :admin_comments, only:[:create, :destroy]
  	end
  	patch '/users/:id', to: 'users#quit'
  	resources :orders, only:[:index, :show, :update]
  	resources :reviews, only:[:index, :update, :destroy]
  	resources :items, except:[:destroy]
  	resources :artists, only:[:create]
  	resources :genres, only:[:create]
  	resources :labels, only:[:create]
  end

end
