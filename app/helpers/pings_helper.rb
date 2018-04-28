# frozen_string_literal: true

module PingsHelper
  def select_all?
    params[:filter].nil? || params[:filter] == 'all'
  end

  def select_fails?
    params[:filter] == 'fails'
  end
end
