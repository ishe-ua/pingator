# frozen_string_literal: true
# == Schema Information
#
# Table name: pings
#
#  id                        :bigint(8)        not null, primary key
#  target_id                 :bigint(8)
#  start                     :datetime         not null
#  duration(in milliseconds) :integer          not null
#  code                      :integer          not null
#  body                      :text
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#
# Indexes
#
#  index_pings_on_target_id  (target_id)
#
# Foreign Keys
#
#  fk_rails_...  (target_id => targets.id)
#

class Ping < ApplicationRecord
  belongs_to :target

  include Start
  include Duration
  include Code
  include Body
  include Color
end
