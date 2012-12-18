class AddDescriptionFieldsToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :number, :string
    add_column :projects, :description, :string
    add_column :projects, :type_id, :integer
    add_column :projects, :user_id, :integer
  end
end
