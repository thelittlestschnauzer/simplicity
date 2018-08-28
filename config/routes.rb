Rails.application.routes.draw do

  resources :recipes

  resources :teams

  resources :notes

  get '/notes/:id/chat', to: 'notes#chat', as: 'note_chat'
  post '/messages', to: 'message#create'
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

  devise_scope :user do
    get '/logout', to: 'devise/sessions#destroy'
  end

  devise_for :users, controllers: { registrations: 'registrations', omniauth_callbacks: 'users/omniauth_callbacks' }

  get '/today', to: 'pages#index'
  root to: 'home#land'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
