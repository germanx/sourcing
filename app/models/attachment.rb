class Attachment < ActiveRecord::Base
  attr_accessible :attachment

  belongs_to :project

  has_attached_file :attachment, :path => ":rails_root/:class/:attachment/:id_partition/:style/:filename"
end
