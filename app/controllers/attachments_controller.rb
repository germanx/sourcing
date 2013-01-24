class AttachmentsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :find_project_by_params_id, :only => [:manage]


  def show
    attachment = Attachment.find(params[:id])
    if can?(:view, attachment.project)
      send_file attachment.attachment.path
    else
      flash[:error] = "The attachment you were looking for could not be found (permission denied)."
      redirect_to root_path
    end
  end

  def new
    @project = Project.new
    attachment = @project.attachments.build
    render :partial => "attachments/form",
           :locals => { :number => params[:number].to_i,
                        :attachment => attachment }

  end

  def destroy
    attachment = Attachment.find(params[:id])
    project = attachment.project
    attachment.destroy

    respond_to do |format|
      format.html { redirect_to manage_attachments_path(:id => project) }
      format.json { head :no_content }
    end
  end

  def manage
  end
end
