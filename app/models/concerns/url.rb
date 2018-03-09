# frozen_string_literal: true

# Field +url+ in table:
# * string
#
module Url
  extend ActiveSupport::Concern

  SUPPORTED_SCHEMES = %w[http https].freeze

  MAX_LENGTH = 256

  included do
    before_validation :add_supported_scheme

    validates :url,
              presence: true,
              uniqueness: { scope: :user },
              length: { maximum: MAX_LENGTH },
              format: { with: URI::DEFAULT_PARSER.make_regexp }
  end

  protected

  def add_supported_scheme
    return if url.blank?
    b = false
    SUPPORTED_SCHEMES.each { |name| b = true if url.start_with?(name + '://') }
    self.url = 'http://' + url unless b
  end
end
