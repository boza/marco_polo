Rails.application.routes.draw do

  resources :travel_journals

  root  'home#index'

end
