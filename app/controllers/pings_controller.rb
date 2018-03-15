# frozen_string_literal: true

# See Ping
class PingsController < ApplicationController
  before_action :set_target, only: :index

  def index; end

  private

  def set_target
    @target = current_user.targets.find(params[:target_id])
  end
end
