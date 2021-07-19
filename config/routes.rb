Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :spaces do
        resources :reviews, only: [:create, :destroy]
        resources :bookings, only: [:create, :destroy]
      end
    end
  end
end
