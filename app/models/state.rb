# frozen_string_literal: true

# == Schema Information
#
# Table name: states
#
#  id        :integer          not null, primary key
#  target_id :integer
#  time      :datetime         not null
#  type      :integer          not null
#  code      :integer          not null
#  body      :text
#
# Indexes
#
#  index_states_on_target_id  (target_id)
#
# Foreign Keys
#
#  fk_rails_...  (target_id => targets.id)
#
class State < ApplicationRecord
  belongs_to :target
end
