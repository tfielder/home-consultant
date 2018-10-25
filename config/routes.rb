Rails.application.routes.draw do
  root 'session#new'
  post '/', to: 'session#create'
end
