Rails.application.routes.draw do
  root "articles#index"
  # Defines the root path route ("/")
  get "/articles", to: "articles#index"
  
 
end
