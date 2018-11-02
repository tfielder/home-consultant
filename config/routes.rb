Rails.application.routes.draw do
  root 'session#new'
  post '/', to: 'session#create'
  post '/sessions', to: 'session#destroy'
  post '/main_page', to: 'main_page#create'
  resources :main_page, only: [:create, :index, :prepare]
end
