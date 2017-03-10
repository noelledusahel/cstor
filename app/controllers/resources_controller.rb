class ResourcesController < ApplicationController
  def index
    @resources = Resource.order(updated_at: :desc)
  end

  def show
    @resource = Resource.find(params[:id])
    @tags = @resource.tags
    @likes = @resource.likes
  end

  def new
    if !current_user.admin
      redirect_to resources_path
    end
  end

  def create
    @resource = current_user.resources.new(resource_params)
    if @resource.save && current_user.admin
      tags = tag_params[:tag].split(',').map! {|tag| tag.lstrip}
      tags.each do |tag|
        if Tag.find_by(name: tag)
          @resource.tags << Tag.find_by(name: tag)
        else
          @resource.tags << Tag.create(name: tag)
        end
      end
      redirect_to @resource, notice: "Your Resource was a success!"
    else
      @errors = @resource.errors.full_messages
      render :new, status: 400
    end
  end

  def edit
    if !current_user.admin
      redirect_to resource_path
    end
   @resource = Resource.find(params[:id])
  end

  def update
    @resource = Resource.find(params[:id])
    @resource.update_attributes(resource_params)
    if @resource.save
      redirect_to resource_path(@resource)
    else
      @errors = @resource.errors.full_messages
      render 'edit'
    end
  end

 def destroy
  if current_user.admin == true
    @resource = Resource.find(params[:id])
    @resource.destroy
  end
  redirect_to resources_path
end

private

def resource_params
  params.require(:resource).permit(:title, :abstract, :url, :teacher_only)
end

def tag_params
  params.require(:resource).permit(:tag)
end

end
