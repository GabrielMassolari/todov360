Rails.application.routes.draw do
  devise_for :users
  
  root to: 'lists#index'

  resources :tasks do
    member do
      patch :update_status
    end
  end

  resources :lists

  get '/dashboard', to: 'dashboards#index'
end
