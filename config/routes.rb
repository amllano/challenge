Rails.application.routes.draw do
  get 'home/index'

  resources :games
  
  root "home#index"
end
