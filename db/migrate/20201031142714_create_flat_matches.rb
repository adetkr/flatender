class CreateFlatMatches < ActiveRecord::Migration[6.0]
  def change
    create_table :flat_matches do |t|
      t.references :match, null: false, foreign_key: true
      t.references :flat, null: false, foreign_key: true

      t.timestamps
    end
  end
end
