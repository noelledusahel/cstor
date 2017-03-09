class SessionsController < ApplicationController
  def create
    user = current_user
    set_user
    redirect_to root_path
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
