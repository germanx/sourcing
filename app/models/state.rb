class State < ActiveRecord::Base
  attr_accessible :background, :color, :name, :edit

  has_many :projects

  def to_s
    name
  end

end
