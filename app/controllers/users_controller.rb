class UsersController < ApplicationController
  skip_before_action :authorize, only: [:new]
  before_action :set_user, only: %i[ show edit update destroy ]

  # GET /users or /users.json
  def index
    # @users = User.all
    @users = fetch_from_redis
    # puts @users.inspect
  end

  # GET /users/1 or /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        # NotifierMailer.user_register_email(@user).deliver_now #send mail normal
        SendEmailJob.set(wait: 2.minutes).perform_later @user #csendmail by sidekiq
        format.html { redirect_to users_url, notice: "User was successfully created." }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to users_url, notice: "User was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: "User was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:name, :hashed_password, :salt, :password, :password_confirmation, :email)
    end

    def fetch_from_redis
      begin
        users = $redis.get "users"
        # puts users.inspect
        if users.nil? 
          users = User.all
          $redis.set "users", users
        end
        JSON.load users
      rescue => error
        # puts error.inspect
        users = User.all
      end
      users
    end
end
