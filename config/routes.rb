Rails.application.routes.draw do
  resources :carts
  devise_for :user, only: []
  
  resource :login, only: [:create], controller: :sessions
  resources :users, only: [:index, :show, :create] do
    resources :baggages
  end

  resources :baggages
    post '/rental/:id' => 'baggages#rental'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end