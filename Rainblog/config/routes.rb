Rainblog::Application.routes.draw do
  
  get 'log_out' => 'sessions#destroy', as: 'log_out'
  get 'log_in' => 'sessions#new', as: 'log_in'
  get 'sign_up' => 'users#new', as: 'sign_up'
  root to: 'welcome#index'

  resources :posts
  resources :users, except: :index
  resources :sessions
end
