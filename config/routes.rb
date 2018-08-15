Rails.application.routes.draw do

  resources :notes

  resources :lists do
    resources :tasks
  end

  resources :appointments
  resources :categories

  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
  end

  devise_scope :user do
    get '/signup', to: 'devise/registrations#new'
  end



  # devise_for :users, :controllers => { :registrations => "registrations" }
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  get 'home', to: 'home#land'
  root to: 'pages#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
