class AddFirmToProjects < ActiveRecord::Migration
  def change

    add_column :projects, :firm_id, :integer
    
    add_column :users, :firm_id, :integer
    add_column :users, :name,    :string
    add_column :users, :position,:string
    add_column :users, :phone,   :string

  end
end
