# frozen_string_literal: true

# == Schema Information
#
# Table name: checks
#
#  id        :integer          not null, primary key
#  target_id :integer
#  time      :datetime         not null
#  duration  :integer          not null
#  code      :integer          not null
#  body      :text
#
# Indexes
#
#  index_checks_on_target_id  (target_id)
#
# Foreign Keys
#
#  fk_rails_...  (target_id => targets.id)
#
class Check < ApplicationRecord
  belongs_to :target
end
