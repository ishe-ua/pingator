# frozen_string_literal: true

# == Schema Information
#
# Table name: targets
#
#  id                 :integer          not null, primary key
#  user_id            :integer
#  url                :string           not null
#  plan               :float            not null
#  verification       :integer
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
#  index_targets_on_verification        (verification)
#  index_targets_on_verification_token  (verification_token) UNIQUE
#
class Target < ApplicationRecord
  belongs_to :user
  has_many :pings, dependent: :delete_all

  include Url
  include Plan
  include Status
  include Verification
  include Lock

  def last_ping
    pings.order(:created_at).last
  end

  def pings_with(status)
    color_name = Ping.color_by(status).to_s.pluralize
    Ping.send(color_name).where(target_id: id)
  end
end
