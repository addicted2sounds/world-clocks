Rails.application.routes.draw do
  namespace :api do
    resources :timezones
    resources :users
  end
  post 'user_token' => 'user_token#create'
end
