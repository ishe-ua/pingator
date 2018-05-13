# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id          :bigint(8)        not null, primary key
#  account_id  :bigint(8)
#  name        :string
#  country     :string
#  timezone    :string
#  locked_at   :datetime
#  lock_reason :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_users_on_account_id  (account_id)
#  index_users_on_locked_at   (locked_at)
#  index_users_on_name        (name)
#
# Foreign Keys
#
#  fk_rails_...  (account_id => accounts.id)
#

class User < ApplicationRecord
  belongs_to :account
  has_many :targets, dependent: :destroy

  include Name
  include Country
  include Timezone
  include Lock
end
