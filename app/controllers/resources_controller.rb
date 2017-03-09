class ResourcesController < ApplicationController
  def index
    @resources = Resource.all
  end

  def show
    @resource = Resource.find(params[:id])
    @tags = @resource.tags
    @likes = @resource.likes
  end

  def new
    @resource = Resource.new
  end

  def create
    @resource = Resource.new(resource_params)

    if @resource.save
      redirect_to @resource, notice: "Your Resource was a success!"
    else
      render :new, status: 400
    end
  end



  private

  def resource_params
    params.require(:resource).permit(:title, :abstract, :url, :teacher_only)
  end
end
