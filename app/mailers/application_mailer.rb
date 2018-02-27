# frozen_string_literal: true

# Base mailer
class ApplicationMailer < ActionMailer::Base
  default from: "#{APP::NAME} <#{APP::NOREPLY_EMAIL}>"
  layout 'mailer'
end
