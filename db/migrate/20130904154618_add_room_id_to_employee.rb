class AddRoomIdToEmployee < ActiveRecord::Migration
  def change
	add_column :employees, :room_id, :integer
  end
end
