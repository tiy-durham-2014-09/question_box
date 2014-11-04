class UsersController < ApplicationController
  before_action :current_user
  before_action :authenticate, only: [:show]

  def new
    @user = User.new
  end

  def index
    @user = @current_user
  end

  def show
    @questions = Question.order(created_at: :desc).page params[:page]
    @user = User.new
  end

  def update
    respond_to do |format|
      format.html do
        @current_user.update(user_params)
        flash.now[:notice] = 'Your tag list was successfully created.'
        redirect_to root_path
      end
      format.js do
        @current_user.update(user_params)
        render 'users/create', status: :success
      end
    end
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:current_user_id] = @user.id
      redirect_to root_path, success: "You are successfully registered."
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :tag_list)
  end
end
