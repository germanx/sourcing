class ProjectsController < ApplicationController
  before_filter :authorize_publisher!, :except => [:index, :show]
  before_filter :authenticate_user!, :only => [:index, :show]
  before_filter :find_project, :only => [
                    :show,
                    :edit,
                    :update,
                    :destroy]
  before_filter :find_states, :only => [:new, :edit]
 
  def index
    @projects_by_firm = Project.for(current_user).all.group_by{ |project| project.firm.name}
  end

  def new
    @project = Project.new

    @states.each do |state|
      stage = @project.stages.build :state => state
      stage.project = @project
    end
  end

  def create
    @project = Project.new(params[:project])
    @project.user = current_user
    
    if @project.firm.nil?
      @project.firm = current_user.firm
    end

    if @project.state.nil?
      @project.state_id = 1
    end

    if @project.save
      Permission.create!(:user => current_user,
                         :thing => @project,
                         :action => 'view')
      Permission.create!(:user => current_user,
                         :thing => @project,
                         :action => 'edit')
      
      flash[:notice] = "Project has been created."
      redirect_to @project
    else
      flash[:alert] = "Project has not been created."
      render :action => "new"
    end
  end

  def show
    @response = Response.find_by_project_id_and_firm_id(@project.id,current_user.firm.id)
  end

  def edit
  end

  def update
    if @project.update_attributes(params[:project])
      flash[:notice] = "Project has been updated."
      redirect_to @project
    else
      flash[:alert] = "Project has not been updated."
      render :action => "edit"
    end
  end

  def destroy
    @project.destroy
    flash[:notice] = "Project has been deleted."
    redirect_to projects_path
  end

  private
 
    def find_project
      @project = Project.readonly(false).for(current_user).find(params[:id])
      rescue ActiveRecord::RecordNotFound
      flash[:alert] = "The project you were looking for could not be found."
      redirect_to projects_path
    end
end
