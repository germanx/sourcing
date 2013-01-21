class State < ActiveRecord::Base
  attr_accessible :background, :color, :name

  has_many :projects

  def to_s
    name
  end

end
