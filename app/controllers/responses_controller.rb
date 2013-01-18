class ResponsesController < ApplicationController

  before_filter :authenticate_user!                  
  before_filter :find_project  
  before_filter :find_response, :only => [
                    :show,
                    :edit,
                    :update,
                    :destroy]
  before_filter :find_user_firms, :only => [:new, :edit]
  
  def index
    @responses = @project.responses
  end

  def new
    @response = @project.responses.build
    @response.assets.build
  end

  def create
    @response = @project.responses.build(params[:response].merge!(:user => current_user))
    if @response.save
      flash[:notice] = "Response has been created."
      redirect_to @project
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

  def invite
    invite_count = 0
    @project.responses.each do |response|
      response.firm.users.each do |user|
        begin
          ProjectNotifier.invite(response, user).deliver
          invite_count += 1
        rescue Exception
          # ignore for dev/test
        end
        Permission.where(:user_id => user.id,
          :thing_id => response.project.id,
          :thing_type => 'Project',
          :action => 'view').first_or_create
      end
    end
    flash[:notice] = invite_count.to_s + " invitations has been send."
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
