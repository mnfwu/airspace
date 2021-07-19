Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      get '/user', to: 'user#find_user'
      resources :spaces do
        resources :reviews, only: %i[create destroy]
        resources :bookings, only: %i[create destroy]
      end
      get '/space/:space_id/reviews', to: 'reviews#show_space_reviews', as: 'show_space_review'
      get '/spaces/user/:user_id', to: 'spaces#show_user_spaces', as: 'show_user_spaces'
      get '/bookings/user/:user_id', to: 'bookings#show_user_bookings', as: 'show_user_bookings'
    end
  end
end
