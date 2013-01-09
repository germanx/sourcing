class CreateResponse < ActiveRecord::Migration

  def up
    create_table :responses do |t|
      t.text        :description
      t.references  :project
      t.references  :firm
      t.references  :user

      t.timestamps
    end

    add_column :assets, :response_id, :integer
    remove_column :assets, :ticket_id
  end
  
  def down
    drop_table :responses

    add_column :assets, :ticket_id, :integer
    remove_column :assets, :response_id
  end

end
