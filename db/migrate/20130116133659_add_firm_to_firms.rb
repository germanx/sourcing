class AddFirmToFirms < ActiveRecord::Migration
  def change
    add_column :firms, :firm_id, :integer
  end
end
