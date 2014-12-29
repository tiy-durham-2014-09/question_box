class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  
  def show
    @user = User.find_by(params[:token])
  end 
  def new
    @user = User.new
<<<<<<< HEAD
  end
  
  def account_confirmation
    @user = User.find_by_token(params[:token])
    if @user
      redirect_to new_login_path, notice: "Yay, your account has been confirmed!"
    else
      redirect_to new_login_path, notice: "woops, your account could not be confirmed"
    end
=======
>>>>>>> 66bf726a78e18dafded69c8dc07dc8b10c383a19
  end

  def create
    @user = User.new(user_params)
    if @user.save
<<<<<<< HEAD
      # @user.send_confirmation
      UserMailer.registration_confirmation(@user).deliver
      redirect_to user_path(@user), notice: 'User was successfully created.'
      # render nothing: true, status: :created
=======
      session[:current_user_id] = @user.id
      # res = HTTParty.post("https://api.sendhub.com/v1/contacts/?username=#{ENV['SENDHUB_NUMBER']}&api_key=#{ENV['SENDHUB_KEY']}", body: { "name" => @user.name, "number" => @user.phone}.to_json, headers: {"Content-Type" => "application/json"})
      #need to access env variables in .env, but not working
      # user_data = JSON.parse(res.body)
      # u = @user
      # contact_array = user_data.find{|key, _| key["id"]}
      # u.contact = "#{contact_array.second}"
      # u.save
      # u
      redirect_to root_path, success: "You are successfully registered."
>>>>>>> 66bf726a78e18dafded69c8dc07dc8b10c383a19
    else
      render :new
    end
  end

  private

<<<<<<< HEAD
    def set_user
      @user = User.find(params[:id])
    end
    
    # def set_account_confirmation
 #      @
 #    end
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
=======
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :phone, :contact)
  end
>>>>>>> 59839e087fc3048ea2dfd5a33afbd2fe00cca80c
end

