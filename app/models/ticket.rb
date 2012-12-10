class Ticket < ActiveRecord::Base
  belongs_to :project
  attr_accessible :description, :title

  validates :description, :presence => true,
                          :length => { :minimum => 10 }
  validates :description, :presence => true
end
