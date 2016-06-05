module Api
  class UsersController < ApplicationController
    before_action :set_user, only: [:show, :update, :destroy]
    before_action :authenticate_user, except: [:create]

    # GET /users
    def index
      authorize User
      @users = policy_scope(User)
      render json: @users
    end

    # GET /users/1
    def show
      render json: @user
    end

    # POST /users
    def create
      skip_authorization
      @user = User.new(permitted_attributes User)

      if @user.save
        render json: @user, status: :created,
               location: api_user_path(@user)
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /users/1
    def update
      authorize @user
      if @user.update(permitted_attributes User)
        render json: @user
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    end

    # DELETE /users/1
    def destroy
      authorize @user
      @user.destroy
    end

    private
      def set_user
        @user = User.find(params[:id])
      end
  end
end