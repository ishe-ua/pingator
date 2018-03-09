# frozen_string_literal: true

ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../config/environment', __dir__)
require 'rails/test_help'

Dir[
  Rails.root.join('test', 'support', '**', '*.rb'),
  Rails.root.join('test', '**', 'shared', '**', '*.rb')
].each { |f| require f }

# For mock and stub
require 'minitest/autorun'

class ActiveSupport::TestCase
  attr_reader :instance, :modul, :klass, :mailer, :job
  delegate :class, to: :instance, prefix: true

  fixtures :all
  include ActiveRecord::Tasks::DatabaseTasks # for fixtures_path
end

class ActionDispatch::IntegrationTest
  include ActionMailer::TestHelper
  include ActiveJob::TestHelper

  def sign_in(sym_name = :mary)
    account = accounts(sym_name)
    post sessions_path, params: {
      email: account.email,
      password: APP::DEFAULT_PASSWORD
    }
  end
end
