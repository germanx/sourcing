class Firm < ActiveRecord::Base
  attr_accessible :name, :description, :email, :id

  validates :name,        presence: true, length: { maximum: 100 }
  validates :description, length: { maximum: 250 }
  validates :email,       length: { maximum: 50 }

  belongs_to :firm

  has_many :users
  has_many :projects
  has_many :responses

  def self.for(user)
    user.admin? ? Firm.all : Firm.find_all_by_firm_id(user.firm_id)
  end
end
