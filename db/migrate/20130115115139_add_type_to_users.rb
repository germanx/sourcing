class AddTypeToUsers < ActiveRecord::Migration
  def change
    add_column :users, :publisher, :boolean, :default => false
  end
end
