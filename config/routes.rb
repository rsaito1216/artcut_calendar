Rails.application.routes.draw do
  devise_for :users
  resources :events
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "events#index"
  resources :users, only: [:show, :index]
end
