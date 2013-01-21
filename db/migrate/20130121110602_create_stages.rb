class CreateStages < ActiveRecord::Migration
  def change
    create_table :stages do |t|
      t.integer :project_id
      t.integer :state_id
      t.datetime :stage_start

      t.timestamps
    end
  end
end
