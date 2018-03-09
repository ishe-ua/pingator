# frozen_string_literal: true

# See Target
class TargetsController < ApplicationController
  before_action :set_target, only: %i[edit update destroy]

  def index; end

  private

  def set_target
    @target = current_user.targets.find(params[:id])
  end

  def target_params
    params.require(:target).permit(:url, :plan)
  end
end
