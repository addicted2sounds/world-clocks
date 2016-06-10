module Api
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
      @timezone = Timezone.new permitted_params(Timezone)
      # @timezone = Timezone.new permitted_attributes(Timezone)
      @timezone.user = current_user if current_user.user?
      authorize(@timezone)
      if @timezone.save
        render json: @timezone, status: :created,
               location: api_timezone_path(@timezone)
      else
        respond_with_errors @timezone
      end
    end

    # PATCH/PUT /timezones/1
    def update
      if @timezone.update_attributes(permitted_attributes(@timezone))
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

      def set_timezone
        @timezone = Timezone.find(params[:id])
        authorize(@timezone)
      end
  end
end