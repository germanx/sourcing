class Firm < ActiveRecord::Base
  attr_accessible :name, :description, :email

  validates :name,        presence: true, length: { maximum: 100 }
  validates :description, presence: true, length: { maximum: 250 }
  validates :email,       presence: true, length: { maximum: 50 }

  has_many :employees

end
