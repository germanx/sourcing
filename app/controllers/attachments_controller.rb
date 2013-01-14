class AttachmentsController < ApplicationController
  before_filter :authenticate_user!

  def show
    attachment = Attachment.find(params[:id])
    if can?(:read, attachment.project)
      send_file attachment.attachment.path
    else
      flash[:alert] = "The attachment you were looking for could not be found (permission denied)."
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

end
