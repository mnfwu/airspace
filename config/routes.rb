Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :spaces do
        resources :reviews, only: [:create, :destroy]
        resources :bookings, only: [:create, :destroy]
        get '/bookings/:id', to: 'bookings#show_user_bookings', as: "show_user_bookings"
        get '/space/:id/review', to: 'reviews#show_space_reviews', as: "show_space_review"
        get '/spaces/user/:id', to: 'spaces#show_user_spaces', as: "show_user_spaces"
      end
      get '/user', to: "user#find_user"
    end
  end
end
