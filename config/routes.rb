Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :tools, only: [:show, :index, :new, :create]

  resources :users, only: [:show, :index] do
    resources :tools, only: [:edit, :update]
  end
end
