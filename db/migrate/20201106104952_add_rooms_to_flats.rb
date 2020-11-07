class AddRoomsToFlats < ActiveRecord::Migration[6.0]
  def change
    add_column :flats, :rooms, :integer
  end
end
