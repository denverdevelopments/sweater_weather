Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :forecast, only: [:index]
      resources :backgrounds, only: [:index]
      resources :users, only: [:create]
      resources :sessions, only: [:create]
      resources :road_trip, only: [:create]
    end
  end

  #Redirect URI (optional for 'Public' permissions) urn:ietf:wg:oauth:2.0:oob
end
