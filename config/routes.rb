Rails.application.routes.draw do
  namespace :api do
    resources :timezones
    resources :users
    post 'user_token' => 'user_token#create'
  end
end
