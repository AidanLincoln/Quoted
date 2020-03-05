Rails.application.routes.draw do
  root 'quotes#home'
  resources :users_quotes
  resources :authors
  resources :quotes
  resources :users
  get '/login' => 'sessions#new'
  post '/sessions' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  get '/search' => 'quotes#search'
  post '/search_results' => 'quotes#search_results'
  post '/add_favorite' => 'users#add_favorite_quote'
  get '/favorites' => 'users#favorites'
  post '/remove' => 'users#remove_favorite'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
