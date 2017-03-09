class UsersController < ApplicationController
  def show
    find_user
  end

  def admin_new
    @user = User.new
    render 'new_admin'
  end

  def admin_create
    @user = User.new(user_params)
    @user.admin = true
    if @user.save
      session[:user_id] = @user.id
      redirect_to resources_path
    else
      render 'new'
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      set_user(@user)
      redirect_to resources_path
    else
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :admin, :password)
  end

  def find_user
    @user = User.find_by(id: params[:id])
  end
end
