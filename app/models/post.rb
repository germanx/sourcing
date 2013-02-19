class Post < ActiveRecord::Base
  attr_accessible :attachment_count, :from, :recipient, :sender, :subject, :timestamp
  belongs_to :project
  has_many :post_attachments
end
