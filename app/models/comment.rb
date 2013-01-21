class Comment < ActiveRecord::Base
  attr_accessible :text, :project_id, :user_id, :user

  validates :text, :presence => true

  belongs_to :project
  belongs_to :user
  
end
