Rails.application.routes.draw do
  root "articles#index"
  # Defines the root path route ("/")
  resources :articles
 
end
