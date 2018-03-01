# frozen_string_literal: true

Rails.application.routes.draw do
  root 'pages#home'

  controller :pages do
    get 'home'
  end

  ###
  # Sidekiq monitoring
  # See https://github.com/mperham/sidekiq/wiki/Monitoring
  #

  mount Sidekiq::Web, at: '/sidekiq'
  protect_sidekiq
end
