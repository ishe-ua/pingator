# frozen_string_literal: true

# See User
class UsersController < ApplicationController
  skip_before_action :validate_user
  before_action :set_user, only: %i[edit update]

  def edit; end

  def update
    if @user.update(user_params)
      redirect_to settings_path
    else
      render :edit
    end
  end

  private

  def set_user
    @user = signed_in? ? current_user : User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :country)
  end
end
