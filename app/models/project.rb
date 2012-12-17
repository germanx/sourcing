class Project < ActiveRecord::Base
  attr_accessible :name, :attachments_attributes

  validates :name, :presence => true, :uniqueness => true

  has_many :tickets, :dependent => :delete_all
  has_many :permissions, :as => :thing  

  has_many :attachments
  accepts_nested_attributes_for :attachments


  scope :readable_by, lambda { |user|
    joins(:permissions).where(:permissions => { :action => "view",
                                                :user_id => user.id })
  }

  def self.for(user)
    user.admin? ? Project : Project.readable_by(user)
  end

end
