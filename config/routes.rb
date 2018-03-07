# frozen_string_literal: true

Rails.application.routes.draw do
  root 'pages#home'

  controller :pages do
    get 'home'
    get 'info'
    get 'dash'
    get 'settings'
  end

  ###
  # Account
  #

  resources :accounts, except: %i[index show]
  get 'register', to: redirect('accounts/new'), as: :register

  get 'accounts/confirm_email/:token' =>
      'accounts#confirm_email', as: :confirm_email

  get 'accounts/repeat_email_confirmation' =>
      'accounts#repeat_email_confirmation', as: :repeat_email_confirmation

  match 'accounts/reset_password' =>
        'accounts#reset_password', via: %i[get post], as: :reset_password

  ###
  # Others
  #

  resources :users, only: %i[edit update]

  resources :sessions, only: %i[new create destroy]
  resources :contacts, only: %i[new create]

  ###
  # Sidekiq monitoring
  # See https://github.com/mperham/sidekiq/wiki/Monitoring
  #

  mount Sidekiq::Web, at: '/sidekiq'
  protect_sidekiq_with_password
end
