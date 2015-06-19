class ShouldsController < ApplicationController
  include ActionController::HttpAuthentication::Basic::ControllerMethods

  before_action :set_should, only: [:show]

  http_basic_authenticate_with(
    name: Rails.configuration.authorized_name,
    password: Rails.configuration.authorized_password)

  # GET /shoulds
  def index
    render json: Should.all
  end

  # GET /shoulds/1
  def show
    render json: @should
  end

  # POST /shoulds
  def create
    @should = Should.new(should_params)

    if @should.save
      render json: @should, status: :created, location: @should
    else
      render json: @should.errors, status: :unprocessable_entity
    end
  end

  private

  def set_should
    @should = Should.find(params[:id])
  end

  def should_params
    params.require(:should).permit(:user, :context)
  end
end
