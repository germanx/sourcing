class ResponsesController < ApplicationController

  before_filter :authenticate_user!                  
  before_filter :find_project  
  before_filter :find_response, :only => [
                    :show,
                    :edit,
                    :update,
                    :destroy]
  
  def new
    @response = @project.responses.build
    @response.assets.build
  end

  def create
    @response = @project.responses.build(params[:response].merge!(:user => current_user))
    if @response.save
      flash[:notice] = "Response has been created."
      redirect_to [@project, @response]
    else
      flash[:alert] = "Response has not been created."
      render :action => "new"
    end
  end

  def show
  end

  def edit
  end

  def update
    if @response.update_attributes(params[:response])
      flash[:notice] = "Response has been updated."
      redirect_to [@project, @response]
    else
      flash[:alert] = "Response has not been updated."
      render :action => "edit"
    end
  end

  def destroy
    @response.destroy
    flash[:notice] = "Response has been deleted."
    redirect_to @project
  end

  private
    
    def find_project
      @project = Project.for(current_user).find(params[:project_id])
      rescue ActiveRecord::RecordNotFound
        flash[:alert] = "The project you were looking for could not be found."
        redirect_to root_path
    end

    def find_response
      @response = @project.responses.find(params[:id])
    end

end
