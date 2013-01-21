class Stage < ActiveRecord::Base
  attr_accessible :project_id, :state_id, :stage_start

  validates :project_id,  presence: true  
  validates :state_id,    presence: true  
  validates :stage_start, presence: true   

  belongs_to :project
  belongs_to :state

end
