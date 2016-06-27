Rails.application.routes.draw do
  devise_for :users
  resources :post do
    resources :comment
    put :upvote
    put :downvote
  end
  resources :subreddit
  resources :admin
  resources :invite_users
  root 'post#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
