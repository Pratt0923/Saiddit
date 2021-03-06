Rails.application.routes.draw do
  devise_for :users
  resources :post do
    resources :comment do
      resources :reply, except: [:new]
    end
    put :upvote
    put :downvote
  end
  resources :subreddit, only: [:index, :create]
  resources :admin, only: [:index, :create]
  resources :invite_users, only: [:index, :create]
  root 'post#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
