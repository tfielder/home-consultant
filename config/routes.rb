Rails.application.routes.draw do
  root 'session#new'
  post '/', to: 'session#create'
  resources :main_page, only: [:index]
  resources :search, only: [:new]
end
