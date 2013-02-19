class PostAttachment < ActiveRecord::Base
  attr_accessible :post_id, :attachment

  has_attached_file :attachment
end
