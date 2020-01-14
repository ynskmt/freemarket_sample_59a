Rails.application.routes.draw do
  devise_for :users,controllers: {
    sessions: 'users/sessions',
    registrations: "users/registrations",
  }
  
  root 'products#index'
  resources :products, only: [:index, :new]

  resources :mypages, only: [:index] do
    collection do
      get 'logout'
    end
  end

  resources :users, only: [:index]
end
