class Attachment < ActiveRecord::Base
  attr_accessible :attachment

  belongs_to :project

  has_attached_file :attachment,:path => (Rails.root + "attachments/:id").to_s,
                           :url => "/attachments/:id"
end
