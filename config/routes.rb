Rails.application.routes.draw do
  get 'home/index'

  resources :games do 
  	resources :guesses
  end

  
  root "home#index"
end
