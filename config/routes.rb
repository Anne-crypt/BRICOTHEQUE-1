Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  get 'users/:user_id/bookings', to: 'bookings#index'
  patch 'bookings/:id', to: 'bookings#confirm', as: :confirm_booking

  resources :tools
  
end
