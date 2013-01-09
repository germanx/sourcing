class Ticket < ActiveRecord::Base
  attr_accessible :description, :title, :user

  belongs_to :project
  belongs_to :user
  belongs_to :state
  
  validates :title, :presence => true
  validates :description, :presence => true,
                          :length => { :minimum => 10 }
  
  has_many :comments

  has_and_belongs_to_many :watchers, :join_table => "ticket_watchers",
                          :class_name => "User"
end
