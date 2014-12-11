class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?

  ## Pega o usuário logado atualmente
  def current_user
    @current_user ||= AccessUsers.find(session[:user_id]) if session[:user_id]
  end

  ## Identifica se o usuário esta logado ou não
  def logged_in?
    current_user != nil
  end
end
