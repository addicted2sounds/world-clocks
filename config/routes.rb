Rails.application.routes.draw do
  resources :timezones
  resources :users
  post 'user_token' => 'user_token#create'
end
