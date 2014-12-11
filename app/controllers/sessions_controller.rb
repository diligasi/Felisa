class SessionsController < ApplicationController

  def new
  end

  def create
    user = AccessUsers.authenticate(params[:session][:login], params[:session][:password])
    if user
      session[:user_id] = user[:id]
      m = ManagerController.new
      m.index
      render manager_index_path
    else
      redirect_to login_path, :status => :unauthorized
    end
  end

  def destroy
    reset_session
    session.delete(:user_id)
    session[:user_id] = nil
    redirect_to root_path
  end
end
