Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      get '/user', to: 'user#find_user'
      resources :spaces do
        resources :reviews, only: %i[create destroy]
        resources :bookings, only: %i[create destroy]
        get '/space/:id/review', to: 'reviews#show_space_reviews', as: 'show_space_review'
        get '/spaces/user/:id', to: 'spaces#show_user_spaces', as: 'show_user_spaces'
      end
      get '/bookings/user/:user_id', to: 'bookings#show_user_bookings', as: 'show_user_bookings'
    end
  end
end
