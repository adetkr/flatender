class CreateFlats < ActiveRecord::Migration[6.0]
  def change
    create_table :flats do |t|
      t.string :address
      t.text :presentation
      t.integer :rent
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
