class AttachmentsController < ApplicationController
  before_filter :authenticate_user!

  def show
    attachment = Attachment.find(params[:id])
    send_file attachment.attachment.path, :filename => attachment.attachment_file_name, :content_type => attachment.attachment_content_type
    # temporary disable permissions
    #if can?(:view, attachment.project)
    #  send_file attachment.attachment.path, :filename => attachment.attachment_file_name,
    #                                      :content_type => attachment.attachment_content_type
    #else
    #  flash[:alert] = "The attachment you were looking for could not be found."
    #  redirect_to root_path
    #end
  end

  def new
    @project = Project.new
    attachment = @project.attachments.build
    render :partial => "attachments/form",
           :locals => { :number => params[:number].to_i,
                        :attachment => attachment }

  end

end
