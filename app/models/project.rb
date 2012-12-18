class Project < ActiveRecord::Base
  attr_accessible :name, :description, :number, :type_id, :attachments_attributes

  validates :name,        presence: true, length: { maximum: 100 }, uniqueness: true
  validates :description, presence: true, length: { maximum: 250 }
  validates :number,      presence: true, length: { maximum: 30 }
  validates :user_id,     presence: true  

  belongs_to :user

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
