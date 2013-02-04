class Post < ActiveRecord::Base
  attr_accessible :attachment_count, :from, :recipient, :sender, :subject, :timestamp
end
