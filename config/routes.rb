Rails.application.routes.draw do
  resources :carts
  devise_for :user, only: []
  
  resource :login, only: [:create], controller: :sessions
  resources :users, only: [:index, :show, :create] do
    resources :baggages
    resources :carts do
      post '/rental' => 'carts#rental'
    end
  end

  resources :baggages
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end