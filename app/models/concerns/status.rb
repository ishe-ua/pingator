# frozen_string_literal: true

# Field +status+ in table:
# * integer
#
module Status
  extend ActiveSupport::Concern

  included do
    enum status: %i[wait
                    informational
                    success
                    redirection
                    client_error
                    server_error]

    validates :status, presence: true
    after_initialize :set_default_status
  end

  protected

  def set_default_status
    self.status ||= :wait
  end
end
