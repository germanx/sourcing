class AddEditToState < ActiveRecord::Migration
  def change
    add_column :states, :edit, :boolean, :default => true
    State.find_by_name('New').update_attributes!(:edit => 'false')
  end
end
