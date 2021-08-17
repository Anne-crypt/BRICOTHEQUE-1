Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'tools/:tool_id',to: 'tools#show'
  get '/tools', to: 'tools#index'

  # added by Raph
  get '/tools/:id/edit', to: 'tools#edit'
  post 'tools/:id', to: 'tools#update', as: :tool
end
