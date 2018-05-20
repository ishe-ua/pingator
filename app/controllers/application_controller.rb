# frozen_string_literal: true

# Base controller
class ApplicationController < ActionController::Base
  include Auth
  include Resource
  include ValidateUser
end
