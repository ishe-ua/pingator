# frozen_string_literal: true

Rails.application.routes.draw do
  root 'pages#home'
  devise_for :accounts

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

  mount Sidekiq::Web, at: APP::SIDEKIQ_URI
  protect_sidekiq_with_password
end
