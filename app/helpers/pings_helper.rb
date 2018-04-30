# frozen_string_literal: true

module PingsHelper
  def select_all?
    params[:status].nil?
  end

  def select?(status)
    status.to_s == params[:status]
  end
end
