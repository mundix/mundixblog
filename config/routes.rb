Rails.application.routes.draw do

  resources :users
  root 'blog#index'
  get 'about' => 'blog#about'

  resources :articles


end
