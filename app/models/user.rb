class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, 
       #  :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, 
    :publisher, :admin, :name, :position, :phone, :firm_id, :plan
  
  # attr_accessible :title, :body

  def to_s
    "#{email} (#{admin? ? "Admin" : "User"})"
  end

  belongs_to :firm

  has_many :permissions
  has_many :responses
end
