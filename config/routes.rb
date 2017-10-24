Rails.application.routes.draw do
  resources :carts
  devise_for :user, only: []
  
  resource :login, only: [:create], controller: :sessions
  resources :users, only: [:index, :show, :create] do
    put '/get_point' => 'users#get_point'
    resources :baggages
    resources :carts, only: [] do
      post '/rental' => 'carts#rental'
    end
  end

  resources :baggages
  get '/search' => 'baggages#search'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end