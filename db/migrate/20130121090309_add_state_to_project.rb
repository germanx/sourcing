class AddStateToProject < ActiveRecord::Migration
  def up
    add_column :projects, :state_id, :integer
    remove_column :tickets, :state_id
  end
  
  def down
    add_column :tickets, :state_id, :integer
    remove_column :projects, :state_id
  end
end
