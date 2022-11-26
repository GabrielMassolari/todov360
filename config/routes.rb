Rails.application.routes.draw do
  devise_for :users
  root to: 'lists#index'

  resources :tasks
  resources :lists
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
