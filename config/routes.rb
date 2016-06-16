Rails.application.routes.draw do
  namespace :api do
    resources :timezones
    get '/users' => 'users#current',
        constraints: { query_string: /current=1/ }
    resources :users do
      get 'current', on: :collection
    end
    post 'user_token' => 'user_token#create'
  end
  get '(*path)', to: 'ember#index'
end
