class ShouldsController < ApplicationController
  before_action :set_should, only: [:show]

  # GET /shoulds
  def index
    @shoulds = Should.all

    render json: @shoulds
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
