# frozen_string_literal: true

# Time zone.
#
# Field +timezone+ in table:
# * string
#
module Timezone
  extend ActiveSupport::Concern

  SUPPORTED_TZ_NAMES = ActiveSupport::TimeZone::MAPPING.values

  included do
    alias_attribute :tz, :timezone
    validates :timezone, inclusion: { in: SUPPORTED_TZ_NAMES }, allow_nil: true
  end
end
