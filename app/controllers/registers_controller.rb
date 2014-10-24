class RegistersController < ApplicationController
  
  def new
    @register = Register.new
  end
  def update
    @user = @register.user
    if @user.update(register_params)
      @register.update_column(click: true)
      @register.update_column(token: nil)
      redirect_to root_path, success: "Your registration is complete!"
  end
  
  private
  
  def register_params
    params.require(:user).permit(:token, :clicked) 
  end
    
end
