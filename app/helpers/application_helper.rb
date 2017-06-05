module ApplicationHelper
  def is_login?
    session[:sf_cred]
  end
end
