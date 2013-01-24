class ProjectsController < ApplicationController
  before_filter :authorize_publisher!, :except => [:index, :show]
  before_filter :authenticate_user!, :only => [:index, :show]
  before_filter :find_project_by_params_id, :only => [
                    :show,
                    :edit,
                    :update,
                    :destroy,
                    :change_state]
  before_filter :find_states, :only => [:new, :edit, :show]
 
  def index
    @projects_by_firm = Project.for(current_user).all.group_by{ |project| project.firm.name}
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(params[:project])
    @project.user = current_user
    
    if @project.firm.nil?
      @project.firm = current_user.firm
    end

    if @project.state.nil?
      @project.state = State.find_by_name('New')
    end

    if @project.save
      Permission.create!(:user => current_user,
                         :thing => @project,
                         :action => 'view')
      Permission.create!(:user => current_user,
                         :thing => @project,
                         :action => 'edit')

      if @project.stages.count == 0
        stage = @project.stages.build :state => State.find_by_name('New')
        stage.project = @project
        stage.stage_start = Date.today
        stage.save
      end

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

  def change_state
    @project.state = State.find(params[:state])
    if @project.save
      flash[:notice] = "Project state has been updated."
      redirect_to @project
    else
      flash[:alert] = "Project state has not been updated."
      redirect_to @project
    end
    
  end
end
