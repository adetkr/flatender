class AddSurfaceToFlats < ActiveRecord::Migration[6.0]
  def change
    add_column :flats, :surface, :integer
  end
end
