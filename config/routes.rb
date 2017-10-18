Rails.application.routes.draw do
  devise_for :user, only: []
  
  namespace :v1, defaults: { format: :json } do
    resource :login, only: [:create], controller: :sessions
    resource :users, only: [:create]
    resources :baggages
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
