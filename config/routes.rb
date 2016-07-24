Rails.application.routes.draw do

  resources :comments
  resources :users
  root 'blog#index'
  get 'about' => 'blog#about'

  resources :articles

  get 'signup', to: 'users#new'
  post 'users', to: 'users#create'

end
