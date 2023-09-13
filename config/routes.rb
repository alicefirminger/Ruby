Rails.application.routes.draw do
  devise_for :users
  root "articles#index"
  resources :articles
  get 'articles/search', to: 'articles#search', as: 'search_articles'
end
