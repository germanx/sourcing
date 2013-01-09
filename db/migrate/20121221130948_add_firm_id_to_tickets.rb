class AddFirmIdToTickets < ActiveRecord::Migration
  def change
    add_column :tickets, :firm_id, :integer
  end
end
