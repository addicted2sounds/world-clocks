class TimezonesController < ApplicationController
  before_action :authenticate_user
  before_action :set_timezone, only: [:show, :update, :destroy]

  # GET /timezones
  def index
    @timezones = policy_scope Timezone
    render json: @timezones
  end

  # GET /timezones/1
  def show
    render json: @timezone
  end

  # POST /timezones
  def create
    @timezone = Timezone.new(timezone_params)

    if @timezone.save
      render json: @timezone, status: :created, location: @timezone
    else
      render json: @timezone.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /timezones/1
  def update
    if @timezone.update(timezone_params)
      render json: @timezone
    else
      render json: @timezone.errors, status: :unprocessable_entity
    end
  end

  # DELETE /timezones/1
  def destroy
    @timezone.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_timezone
      @timezone = Timezone.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def timezone_params
      params.require(:timezone).permit(:user_id, :name, :city, :difference)
    end
end
