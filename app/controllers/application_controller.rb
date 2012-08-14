class ApplicationController < ActionController::Base
  protect_from_forgery

  # Extends devise functionality for better redirects
  def after_sign_in_path_for(resource)
    if !session[:return_to].nil?
      session[:return_to]
    else
      super
    end
  end

  # Extends devise functionality for better redirects
  def authenticate_user!
    if !user_signed_in?
      store_unauthenticated_input
      generate_redirect_path
    end
    super
  end

  def store_unauthenticated_input
    session[:reuse_data] = request.parameters[:item] if request.parameters[:item]
    warn session[:reuse_data]
  end

  def generate_redirect_path
    redirect_path = request.fullpath
    redirect_path += '/new' if (request.parameters['action'] == "create")
    session[:return_to] = redirect_path
  end

end


