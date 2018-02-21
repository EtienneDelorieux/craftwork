Rails.application.routes.draw do

  root to: 'pages#home'

  devise_for :users

  resources :users, only: [:show] do
    resources :reviews, only: [:new, :create]
  end

  resources :projects, :except => [:index] do
    resources :applications, :except => [:show]
  end
end
