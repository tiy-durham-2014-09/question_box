class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:current_user_id] = @user.id
      res = HTTParty.post("https://api.sendhub.com/v1/contacts/?username=9194486757&api_key=4639f9b62be4b60ce70dfb54d30c11214f86f8e9", body: { "name" => @user.name, "number" => @user.phone}.to_json, headers: {"Content-Type" => "application/json"})
      # res = HTTParty.post("https://api.sendhub.com/v1/contacts/?username=#{ENV['SENDHUB_NUMBER']}&api_key=#{ENV['SENDHUB_KEY']}", body: { "name" => @user.name, "number" => @user.phone}.to_json, headers: {"Content-Type" => "application/json"})
      #need to access env variables in .env, but not working
      user_data = JSON.parse(res.body)
      u = @user
      contact_array = user_data.find{|key, _| key["id"]}
      u.contact = "#{contact_array.second}"
      u.save
      u
      redirect_to root_path, success: "You are successfully registered."
    else
      render :new
    end

  end


  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :phone, :contact)
  end
end

