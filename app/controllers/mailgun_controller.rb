class MailgunController < ApplicationController
  skip_before_filter :verify_authenticity_token
  before_filter :find_project_by_params_id, :only => [:list]
  
  def post
     post = Post.new
     post.recipient = params['recipient']
     post.sender = params['sender']
     post.from = params['from']
     post.subject = params['subject']
     post.attachment_count = params['attachment-count'].to_i
     post.timestamp = params['timestamp'].to_i
     post.body = params['body-plain']
     post.project = Project.find_by_email(post.recipient)
     post.save

     post.attachment_count.times do |i|
       att = PostAttachment.new
       att.post_id = post.id
       att.attachment = params["attachment-#{i+1}"]
       att.save!

       stream = params["attachment-#{i+1}"]
       filename = stream.original_filename
       data = stream.read()

       puts "filename: #{filename}"
       puts "stream: #{stream}"
     end
     
     render :text => "OK"
  end

  def list
    @posts = @project.posts
  end

  def item
    @post = Post.find(params[:id])
  end
end
