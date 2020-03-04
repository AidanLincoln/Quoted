Rails.application.routes.draw do
  resources :users_quotes
  resources :authors
  resources :quotes
  resources :users
  get '/login' => 'sessions#new', as:"login"
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'
  get '/search' => 'quotes#search'
  post '/search_results' => 'quotes#search_results'
  
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
