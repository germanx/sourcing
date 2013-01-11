class Firm < ActiveRecord::Base
  attr_accessible :name, :description, :email, :id

  validates :name,        presence: true, length: { maximum: 100 }
  validates :description, presence: true, length: { maximum: 250 }
  validates :email,       presence: true, length: { maximum: 50 }

  belongs_to :user

  has_many :employees
  has_many :responses
end
