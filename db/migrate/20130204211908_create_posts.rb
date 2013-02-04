class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :recipient
      t.string :sender
      t.string :from
      t.string :subject
      t.integer :attachment_count
      t.integer :timestamp

      t.timestamps
    end
  end
end
