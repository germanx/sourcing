class Stage < ActiveRecord::Base
  attr_accessible :state, :state_id, :stage_start

  validates :state_id,    presence: true  
  validates :stage_start, presence: true   

  belongs_to :project
  belongs_to :state
end
