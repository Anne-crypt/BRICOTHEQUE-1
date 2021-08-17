Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'tools/new', to: "tools#new"
  post 'tools', to: "tools#create"
  get 'tools/:tool_id', to: 'tools#show'
  get '/tools', to: 'tools#index'
end
