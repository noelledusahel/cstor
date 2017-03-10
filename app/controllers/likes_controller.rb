class LikesController < ApplicationController
  def new
  end

  def create
    @like = Like.new(liker_id: current_user.id, resource_id: params[:resource_id])
    if @like.save
      redirect_to resources_path
    else
      flash[:notice] = "There was an error"
      redirect_to resources_path
    end
  end

  def destroy
    puts "\n" * 10
    path = URI(request.referer).path
    @like = Like.find_by(liker_id: current_user.id, resource_id: params[:resource_id])
    @like.destroy
    redirect_to path
  end
end
