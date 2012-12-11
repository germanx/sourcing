class Ticket < ActiveRecord::Base
  attr_accessible :description, :title, :user, :asset

  belongs_to :project
  belongs_to :user
  
  validates :title, :presence => true
  validates :description, :presence => true,
                          :length => { :minimum => 10 }

  has_attached_file :asset

end
