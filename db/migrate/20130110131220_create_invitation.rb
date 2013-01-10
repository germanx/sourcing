class CreateInvitation < ActiveRecord::Migration
  def change
    create_table :invitations do |t|
      t.references  :project
      t.references  :firm
      t.datetime    :confirmed_at

      t.timestamps
    end
  end
end
