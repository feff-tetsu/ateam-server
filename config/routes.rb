Rails.application.routes.draw do
  devise_for :user, only: []
  
  resource :login, only: [:create], controller: :sessions
  resources :users, only: [:index, :show, :create] do
    put '/get_point' => 'users#get_point'
    post '/rental' => 'carts#rental'
    get '/favorites' => 'favorites#baggages'
    get '/carts' => 'carts#show_cart'
    resources :baggages do
      post '/add_favorite' => 'favorites#add_favorite'
      post '/add_cart' => 'carts#add_cart'
    end
  end

  resources :baggages
  get '/search' => 'baggages#search'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end