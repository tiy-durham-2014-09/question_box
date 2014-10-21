class RegistersController < ApplicationController
  def new
  end
  
  private
  
  def registers_params
    params.require(:user).permit(:token, :clicked) 
  end
    
end
