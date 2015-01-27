Rails.application.routes.draw do

  resources :travel_journals
  resources :users

  root  'home#index'

end
