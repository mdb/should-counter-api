class UsersController < ApplicationController
  include ActionController::HttpAuthentication::Basic::ControllerMethods

  http_basic_authenticate_with(
    name: Rails.configuration.authorized_name,
    password: Rails.configuration.authorized_password)

  def index
    @users = Should.all.group_by(&:user)

    render json: @users
  end

  def show
    @user = Should.where(user: params[:user])

    render json: @user
  end
end
