# frozen_string_literal: true

Rails.application.routes.draw do
  root 'pages#home'

  controller :pages do
    get 'home'
    get 'info'
    get 'dash'
  end

  ###
  # Others
  #

  resources :sessions, only: %i[new create destroy]
  resources :contacts, only: %i[new create]

  ###
  # Sidekiq monitoring
  # See https://github.com/mperham/sidekiq/wiki/Monitoring
  #

  mount Sidekiq::Web, at: '/sidekiq'
  protect_sidekiq
end
