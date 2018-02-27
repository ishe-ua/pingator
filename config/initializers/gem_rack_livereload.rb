# frozen_string_literal: true

if Rails.env.development?
  Rails.application
       .config
       .middleware.insert_after(ActionDispatch::Static, Rack::LiveReload)
end
