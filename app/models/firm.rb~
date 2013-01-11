class Firm < ActiveRecord::Base
  attr_accessible :name, :description, :email

  validates :name,        presence: true, length: { maximum: 100 }
  validates :description, presence: true, length: { maximum: 250 }
  validates :email,       presence: true, length: { maximum: 50 }

  belongs_to :user

  has_many :employees
    
  def self.for(user)
    find_all_by_user_id(user)
  end

end
