# frozen_string_literal: true

# See Target
class TargetsController < ApplicationController
  before_action :set_target, only: %i[edit update destroy]

  def index; end

  def new
    @target = current_user.targets.build
    @target.plan = nil
  end

  def create
    @target = current_user.targets.build(target_params)
    if @target.save
      redirect_to dash_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if @target.update(target_params)
      redirect_to dash_path
    else
      render :edit
    end
  end

  # See TargetsMailer#destroy_notification
  def destroy
    @target.destroy!
    TargetsMailer.destroy_notification(@target).deliver_later
    redirect_to targets_url
  end

  private

  def set_target
    @target = current_user.targets.find(params[:id])
  end

  def target_params
    params.require(:target).permit(:url, :plan)
  end
end
