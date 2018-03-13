# frozen_string_literal: true

# == Schema Information
#
# Table name: targets
#
#  id                 :integer          not null, primary key
#  user_id            :integer
#  url                :string           not null
#  plan               :integer          not null
#  verified_at        :datetime
#  verification_token :string
#  locked_at          :datetime
#  lock_reason        :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
# Indexes
#
#  index_targets_on_locked_at           (locked_at)
#  index_targets_on_plan                (plan)
#  index_targets_on_url                 (url)
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
  has_many :pings, dependent: :delete_all

  include Url
  include Plan
  include Status
  include Verification
  include Lock

  # From redis or db
  def last_ping
    json = nil # TODO: get from Redis
    json ? Ping.new(json.to_hash) : pings.last
  end
end
