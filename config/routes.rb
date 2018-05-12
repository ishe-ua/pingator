# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :accounts
  root 'pages#home'

  controller :pages do
    get 'home'
    get 'info'
    get 'settings'
  end

  resources :users, only: %i[edit update]
  resources :contacts, only: %i[new create]

  resources :targets, except: :show do
    resources :pings, only: %i[index show]
  end

  get '/dash', to: 'targets#index'

  ###
  # Sidekiq monitoring
  # See https://github.com/mperham/sidekiq/wiki/Monitoring
  #

  mount Sidekiq::Web, at: '/sidekiq'
  protect_sidekiq_with_password
end
