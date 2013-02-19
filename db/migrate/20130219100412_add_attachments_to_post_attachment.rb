class AddAttachmentsToPostAttachment < ActiveRecord::Migration
  def self.up
    add_attachment :post_attachments, :attachment
  end

  def self.down
    remove_attachment :post_attachmenys, :attachment
  end
end
