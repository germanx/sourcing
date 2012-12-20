class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string      :name
      t.references  :firm
      t.string      :email
      t.string      :position
      t.string      :phone

      t.timestamps
    end
  end
end
