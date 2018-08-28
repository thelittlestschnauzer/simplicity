class ApplicationController < ActionController::Base

  def after_sign_in_path_for(resource)
    today_path
  end

  def redirect_if_not_signed_in
    redirect_to login_path if !user_signed_in?
  end

  def redirect_if_signed_in
    redirect_to pages_path if user_signed_in?
  end


end
