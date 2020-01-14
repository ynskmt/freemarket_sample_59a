Rails.application.routes.draw do
  devise_for :users,controllers: {
    sessions: 'users/sessions',
    registrations: "users/registrations",
  }
  devise_scope :user do
    get 'signups/registration', to: 'users/registrations#registration'
    get 'signups/sms_authentication', to: 'users/registrations#sms_authentication'
  end

  root 'products#index'
  resources :products, only: [:index, :new]

  resources :mypages, only: [:index] do
    collection do
      get 'logout'
    end
  end

  resources :users, only: [:index]
end
