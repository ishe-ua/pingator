# frozen_string_literal: true

# See Ping
class PingsController < ApplicationController
  before_action :set_target, only: %i[index show]
  before_action :set_ping, only: :show

  def index
    status = params[:status] || :all
    @pings = @target.pings_with(status).order(created_at: :desc)
               .page(params[:page])
               .per(80)
  end

  def show; end

  private

  def set_target
    @target = current_user.targets.find_by(id: params[:target_id])
    raise 'Bad params' if @target.user != current_user
  end

  def set_ping
    @ping = @target.pings.find_by(id: params[:id])
    raise 'Bad params' if @ping.target.user != current_user
  end
end
