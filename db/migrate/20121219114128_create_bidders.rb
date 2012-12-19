class CreateBidders < ActiveRecord::Migration
  def change
    create_table :bidders do |t|
      t.string :company
      t.string :name
      t.string :email

      t.string    :confirmation_token
      t.datetime  :confirmed_at
      t.datetime  :confirmation_sent_at

      t.timestamps
    end
  end
end
