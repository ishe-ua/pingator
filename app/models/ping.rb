# frozen_string_literal: true

# == Schema Information
#
# Table name: pings
#
#  id         :integer          not null, primary key
#  target_id  :integer
#  start      :datetime         not null
#  duration   :integer          not null
#  code       :integer          not null
#  body       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_pings_on_target_id  (target_id)
#
class Ping < ApplicationRecord
  belongs_to :target
  include Color

  include Start
  include Duration
  include Code
  include Body
end
