Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get "daily_accounts/get_daily_accounts", to: "daily_accounts#get_daily_accounts"
  put "daily_accounts/update_daily_account", to: "daily_accounts#update_daily_account"

  get "booking_informations/retrieve_booking_information", to: "booking_informations#retrieve_booking_information"
  post "booking_informations/save_booking_information", to: "booking_informations#save_booking_information"
  put "booking_informations/update_booking_information", to: "booking_informations#update_booking_information"
end
