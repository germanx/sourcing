class Ticket < ActiveRecord::Base
  attr_accessible :description, :title, :user, :assets_attributes

  belongs_to :project
  belongs_to :user
  belongs_to :state
  
  validates :title, :presence => true
  validates :description, :presence => true,
                          :length => { :minimum => 10 }
  
  has_many :assets
  accepts_nested_attributes_for :assets

  has_many :comments

end