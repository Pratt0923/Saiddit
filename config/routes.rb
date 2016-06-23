Rails.application.routes.draw do
  devise_for :users
  resources :post
  resources :subreddit
  resources :admin
  resources :invite_users
  resources :comment
  root 'post#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
