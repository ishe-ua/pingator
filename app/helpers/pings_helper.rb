# frozen_string_literal: true

module PingsHelper
  def select_all?
    params[:status].nil?
  end

  def select?(status)
    status.to_s == params[:status]
  end

  def color_class(ping)
    klass = ''
    klass = 'red'    if ping.red?
    klass = 'yellow' if ping.yellow?
    klass
  end
end
