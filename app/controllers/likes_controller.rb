class LikesController < ApplicationController
  def new
  end

  def create
    p like_params
    @like = Like.new(like_params)
    if @like.save
      redirect_to resources_path
    else
      flash[:notice] = "There was an error"
      redirect_to resources_path
    end
  end

  def destroy
    @like = Like.find_by(like_params)
    @like.destroy
  end

  private
  def like_params
    liker_id = current_user.id
    resource_id = params[:resource_id]
    params.require(:like).permit(:liker_id, :resource_id)
  end
end
