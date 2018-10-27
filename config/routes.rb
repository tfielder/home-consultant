Rails.application.routes.draw do
  root 'session#new'
  post '/', to: 'session#create'
  resources :search, only: [:new]
  resources :main_page, only: [:index]
end
