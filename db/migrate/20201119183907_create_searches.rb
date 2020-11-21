class CreateSearches < ActiveRecord::Migration[6.0]
  def change
    create_table :searches do |t|
      t.string :city
      t.integer :min_price
      t.integer :max_price
      t.integer :min_surface 
      t.integer :max_surface 
      t.integer :min_rooms
      t.integer :max_rooms
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
