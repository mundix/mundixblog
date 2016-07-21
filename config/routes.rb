Rails.application.routes.draw do

  resources :comments
  resources :users
  root 'blog#index'
  get 'about' => 'blog#about'

  resources :articles


end
