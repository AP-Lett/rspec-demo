Rails.application.routes.draw do
  get '/orders' => 'orders#index'
  get '/orders/:id' => 'orders#show'
  post '/orders' => 'orders#create'
  delete '/orders/:id' => 'orders#destroy'
  patch '/orders/:id' => 'orders#update'

  post '/login' => 'sessions#create'
  post '/users' => 'users#create'
end
