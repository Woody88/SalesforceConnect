class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :require_login

  private

    def require_login
      if !session[:sf_cred]
        flash[:danger] = "Please login"
        redirect_to "/"
      end
    end

end
