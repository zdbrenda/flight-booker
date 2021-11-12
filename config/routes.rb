Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "flights#index"
  resources :flights do
    resources :bookings
  end

  get '/flights/:flight_id/bookings/new/:num_of_passenger', to: 'bookings#create_with_num_of_passengers'
  
end
