Rails.application.routes.draw do
  root to: 'posts#index'
  devise_for :users
  resources :users
  resources :posts

  get 'users/:id/user_posts' => 'users#user_posts', as: :user_posts
end
