class Attachment < ActiveRecord::Base
  attr_accessible :attachment, :description, :attachment_file_name

  belongs_to :project

  has_attached_file :attachment, :path => ":rails_root/attachments/:id/:style/:filename"
end
