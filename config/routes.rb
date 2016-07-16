Rails.application.routes.draw do

  root 'blog#index'
  get 'about' => 'blog#about'

  resources :articles


end
