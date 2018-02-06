Rails.application.routes.draw do
  resources :car_suggestions
  resources :rentals
  resources :superadmins
  resources :cars
  resources :admins
  resources :customers
  resources :register_mailers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  get '/signup' => 'customers#new'
  post '/users' => 'customers#create'
  # get '/cars' => 'cars#show'
  get '/car_search_list'=> 'cars#list'
  post '/car_search_list' => 'cars#list'
  get '/rentals_history' => 'rentals#history'
  post '/rentals_cancel' => 'rentals#cancel'
  post '/rentals_start' => 'rentals#start'
  post '/rentals_finish' => 'rentals#finish'
  root to: 'sessions#new'
end
