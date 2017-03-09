class UsersController < ApplicationController
  def show
    find_user
  end

  def new
    @user = User.new
  end

  def create

  end

  private
  def user_params
    params.require(:user).permit(:username, :email)
  end

  def find_user
    @user = User.find_by(id: params[:id])
  end
end
