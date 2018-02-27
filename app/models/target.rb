# frozen_string_literal: true

# == Schema Information
#
# Table name: targets
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  url        :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_targets_on_url      (url) UNIQUE
#  index_targets_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Target < ApplicationRecord
  belongs_to :user

  include Url
  validates :url, uniqueness: { scope: :user }
end
