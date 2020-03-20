Rails.application.routes.draw do
  root to: 'users#index'
  get 'users/index'
  get 'users/show'
  devise_for :users
end
