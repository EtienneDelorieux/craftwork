Rails.application.routes.draw do

  root to: 'pages#home'

  devise_for :users

  resources :users, only: [:show] do
  end
  resources :reviews, only: [:create]
  resources :projects do
    resources :applications, :except => [:show]
    resources :reviews, only: [:new]
  end
end
