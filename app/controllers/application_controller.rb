class ApplicationController < ActionController::Base
  protect_from_forgery

  # Allows us to redirect users back to actions they intended that required sign-in,
  # rather than the default redirect
  def after_sign_in_path_for(resource)
    if !session[:return_to].nil?
      session[:return_to]
    else
      super
    end
  end

  def authenticate_user!
    if !user_signed_in?
      session[:reuse_data] = request.parameters[:item] if request.parameters[:item]
      redirect_path = request.fullpath
      redirect_path += '/new' if (request.parameters['action'] == "create")
      session[:return_to] = redirect_path
    end
    super
  end
end
