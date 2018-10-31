Rails.application.routes.draw do
  root 'session#new'
  post '/', to: 'session#create'
  post '/main_page', to: 'main_page#create'
  get '/form', to: 'main_page#collect'
  resources :main_page, only: [:create, :index, :prepare, :collect]
end
