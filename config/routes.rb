Rails.application.routes.draw do
  root 'session#new'
  post '/', to: 'session#create'
  resources :search, only: [:new, :create]
  resources :main_page, only: [:index]
end
