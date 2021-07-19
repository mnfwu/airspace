Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :spaces do
        resources :reviews, only: [:create, :destroy]
        resources :bookings, only: [:create, :destroy]
      end
      get '/spaces/user/:id', to: "spaces#show_user"
      get '/space/:id/review', to: "reviews#show_reviews"
      get '/bookings/:id', to: "bookings#show_bookings"
      get '/user', to: "user#find_user"
    end
  end
end
