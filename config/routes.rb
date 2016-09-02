Rails.application.routes.draw do
  get 'home/index'

  resources :games do 
  	resources :guesses
  	resources :turn  	
  end

  root "home#index"
end
