class Employee < ActiveRecord::Base
  attr_accessible :name, :email, :phone, :position

  validates :name,        presence: true, length: { maximum: 100 }
  validates :email,       presence: true, length: { maximum: 50 }
  validates :firm_id,     presence: true  

  belongs_to :firm
  belongs_to :user

end
