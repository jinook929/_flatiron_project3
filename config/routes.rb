Rails.application.routes.draw do
  resources :users, except: [:new, :create]
  get 'signup', to: 'users#new'
  post 'signup', to: 'users#create'
  get '/auth/google_oauth2/callback', to: 'sessions#google_signin'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'application#home'
  get 'info', to: 'application#info'
  get 'sunday', to: 'application#sunday'
end
