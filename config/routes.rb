Rails.application.routes.draw do
  get '/orders' => 'orders#index'
  get '/orders/:id' => 'orders#show'
  post '/orders' => 'orders#create'
  delete '/orders/:id' => 'orders#destroy'
  patch '/orders/:id' => 'orders#update'


  get '/subscriptions' => 'subscriptions#index'
  get '/subscriptions/:id' => 'subscriptions#show'
  post '/subscriptions' => 'subscriptions#create'
  delete '/subscriptions/:id' => 'subscriptions#destroy'
  patch '/subscriptions/:id' => 'subscriptions#update'

  post '/signup', to: 'users#create'
  post '/login' => 'sessions#create'

  get '/users' => 'users#index'
  post '/users' => 'users#create'
end
