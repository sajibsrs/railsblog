Rails.application.routes.draw do
  get 'posts/index'
  get 'posts/new'
  get 'posts/create'
  get 'posts/show'
  get 'posts/edit'
  get 'posts/update'
  get 'posts/destroy'
  root to: 'users#index'
  devise_for :users
  resources :users
  resources :posts
end
