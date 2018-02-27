# frozen_string_literal: true

# == Schema Information
#
# Table name: accounts
#
#  id                       :integer          not null, primary key
#  email                    :string           not null
#  password_digest          :string           not null
#  email_confirmation_at    :datetime
#  email_confirmation_token :string
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#
# Indexes
#
#  index_accounts_on_email                     (email) UNIQUE
#  index_accounts_on_email_confirmation_at     (email_confirmation_at)
#  index_accounts_on_email_confirmation_token  (email_confirmation_token) UNIQUE
#
class Account < ApplicationRecord
  has_one :user, dependent: :destroy
  accepts_nested_attributes_for :user

  include Email
  validates :email, uniqueness: true
end
