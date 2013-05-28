Rainblog::Application.routes.draw do
  
  get 'log_out' => 'sessions#destroy', as: 'log_out'
  get 'log_in' => 'sessions#new', as: 'log_in'
  get 'sign_up' => 'users#new', as: 'sign_up'
  post 'search' => 'users#search', as: 'search'

  root to: 'welcome#index'

  resources :posts do
  	resources :comments, only: [:create, :destroy]
    resources :brohooves, only: [:create, :destroy]
  end

  resources :users, except: :index do
  	resources :brohooves, only: [:create, :destroy]
    get 'blog', on: :member
  end

  resources :comments, only: :destroy
  resources :brohooves, only: :destroy

  resources :sessions, only: [:create, :destroy]
end
