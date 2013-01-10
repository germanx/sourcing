class Response < ActiveRecord::Base
  attr_accessible :description, :user, :assets_attributes

  belongs_to :project
  belongs_to :firm
  belongs_to :user
  
  has_many :assets
  accepts_nested_attributes_for :assets
end