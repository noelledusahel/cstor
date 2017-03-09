class UsersController < ApplicationController
  def index
    # redirect_to resources_path
  end

  def show
    find_user
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    p @user
    if @user.save
      redirect_to new_session_path
    else
      render 'new'
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  def find_user
    @user = User.find_by(id: params[:id])
  end
end
