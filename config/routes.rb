Rails.application.routes.draw do

  root to: 'pages#home'

  devise_for :users

  resources :users, only: [:show] do
    resources :reviews, only: [:new, :create]
  end

  resources :projects do
    resources :applications, :except => [:show]
  end

  get 'applications/:id/:project_id', to: 'applications#select', as: :select_application
end
