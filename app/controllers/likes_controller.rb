class LikesController < ApplicationController
  def new
  end

  def create
    @like = Like.new(liker_id: current_user.id, resource_id: params[:id])
    if @like.save
      p @like
      redirect_to resources_path
    else
      flash[:notice] = "There was an error"
      redirect_to resources_path
    end
  end

  def destroy
    @like = Like.find_by(liker_id: current_user.id, resource_id: params[:id])
    p @like
    @like.destroy
  end


end
