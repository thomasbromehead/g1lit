Rails.application.routes.draw do
  devise_for :users

  root to: 'pages#home'

  resources :flats do 
    resources :reviews, only: [:new, :create, :index]
    collection do 
      get 'top', to: "flats#top"
    end
    member do 
      get "hote", to: "flats#proprio"
    end
  end


  resources :reviews, only: [:destroy, :edit, :update]

  #Will nest form for creating, and updating a booking on a flat's show page
  resources :bookings, except: [:edit, :update, :new, :create] do
    #New payment will simply be a nested g1 pubkey button
    resources :payments,  only: [:create]
  end

  #namespace for listing an owner's own flats
  namespace :proprio do
    resources :flats, only: [:index]
  end



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
