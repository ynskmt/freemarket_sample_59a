Rails.application.routes.draw do
  devise_for :users,controllers: {
    sessions: 'users/sessions',
    registrations: "users/registrations",
  }
  devise_scope :user do
    get 'signups/registration', to: 'users/registrations#registration'
    post 'signups/registration', to: 'users/registrations#create'
    get 'signups/sms_authentication', to: 'users/registrations#sms_authentication'
    post 'signups/sms_authentication', to: 'users/registrations#sms_authentication_create'
  end

  root 'products#index'
  resources :products, only: [:index, :new, :create]

  resources :mypages, only: [:index] do
    collection do
      get 'logout'
    end
  end

  resources :mypages, only: [:index] do
    collection do
      get 'profile'
    end
  end


  resources :users, only: [:index] do
    collection do
      get 'done'
    end
  end

  resources :addresses, only: [:index]

  resources :cards, only: [:index]
end
