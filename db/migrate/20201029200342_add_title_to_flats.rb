class AddTitleToFlats < ActiveRecord::Migration[6.0]
  def change
    add_column :flats, :title, :string
  end
end
