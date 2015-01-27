Rails.application.routes.draw do

  resources :travel_journals do
    resources :locations
  end
  resources :users

  root  'home#index'

end
