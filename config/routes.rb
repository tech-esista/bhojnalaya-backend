Rails.application.routes.draw do
  devise_for :users
    # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

    # Defines the root path route ("/")
    # root "articles#index"

    get "daily_accounts/get_daily_accounts", to: "daily_accounts#get_daily_accounts"
    put "daily_accounts/update_daily_account", to: "daily_accounts#update_daily_account"

    get "booking_informations/retrieve_booking_information", to: "booking_informations#retrieve_booking_information"
    post "booking_informations/save_booking_information", to: "booking_informations#save_booking_information"
    put "booking_informations/update_booking_information", to: "booking_informations#update_booking_information"

    namespace :user do
        match 'add_or_update_user', via: [ :post, :options]
        match 'get_user_profile', via: [ :post, :options]
        match 'request_account_access', via: [ :post, :options]
        match 'get_all_users', via: [ :post, :options]
    end

end
