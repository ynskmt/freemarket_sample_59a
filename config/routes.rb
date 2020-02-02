Rails.application.routes.draw do
  devise_for :users,controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    sessions: 'users/sessions',
    registrations: "users/registrations",
  }
  devise_scope :user do
    get 'signups/sms_authentication', to: 'users/registrations#sms_authentication'
    post 'signups/sms_authentication', to: 'users/registrations#sms_authentication_create'
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
    get 'cards', to: 'users/registrations#new_card'
    post 'cards', to: 'users/registrations#create_card'
  end

  root 'products#index'
  resources :products, only: [:index, :new, :create, :show] do
    collection do
      get "category_children", defaults: { format: 'json' }
      get "category_grandchildren", defaults: { format: 'json' }
    end
  end

  resources :mypages, only: [:index] do
    collection do
      get 'logout'
    end

    member do
      get 'profile'
      post 'update_profile'
      get 'identification'
      post 'update_identification'
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
