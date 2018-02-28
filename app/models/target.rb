# frozen_string_literal: true

#
# == Schema Information
#
# Table name: targets
#
#  id                 :integer          not null, primary key
#  user_id            :integer
#  url                :string
#  checktime          :integer
#  checked_at         :datetime
#  verified_at        :datetime
#  verification_token :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
# Indexes
#
#  index_targets_on_checktime           (checktime)
#  index_targets_on_url                 (url) UNIQUE
#  index_targets_on_user_id             (user_id)
#  index_targets_on_verification_token  (verification_token) UNIQUE
#  index_targets_on_verified_at         (verified_at)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Target < ApplicationRecord
  belongs_to :user

  include Url
  validates :url, uniqueness: { scope: :user }

  include Verification
  include Check
end
