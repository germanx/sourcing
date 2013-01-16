class Firm < ActiveRecord::Base
  attr_accessible :name, :description, :email, :id

  validates :name,        presence: true, length: { maximum: 100 }
  validates :description, presence: true, length: { maximum: 250 }
  validates :email,       presence: true, length: { maximum: 50 }

  has_many :users
  has_many :projects
  has_many :responses
end
