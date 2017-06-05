class MainController < ApplicationController
  skip_before_action :require_login, :only => [:login, :login_]

  def login
    if session[:sf_cred]
      redirect_to "/sf_cases"
    end
    @connection = APIConnect.new
  end

  def login_
    @connection = APIConnect.new(user_params)
    if @connection.valid?
      session[:sf_cred] = true
      flash[:success] = "Successfully logged in"
      redirect_to "/sf_cases"
    else
      flash[:danger] = "Cannot authenticate!"
      redirect_to "/"
    end
  end

  def logout
    session[:sf_cred] = false
    redirect_to "/"
  end

  def report
      
  end

  private

  def user_params
    params.require(:api_connect).permit(:user, :password)
  end
end
