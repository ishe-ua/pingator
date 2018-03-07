# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  account_id :integer
#  name       :string
#  country    :string
#  timezone   :string
#  suspend    :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_users_on_account_id  (account_id)
#  index_users_on_name        (name)
#  index_users_on_suspend     (suspend)
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
  include Suspend
end
