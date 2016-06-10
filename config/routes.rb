Rails.application.routes.draw do
  namespace :api do
    resources :timezones
    resources :users do
      get 'current', on: :collection
    end
    post 'user_token' => 'user_token#create'
  end
end
