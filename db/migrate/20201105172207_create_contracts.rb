class CreateContracts < ActiveRecord::Migration[6.0]
  def change
    create_table :contracts do |t|
      t.string :signature
      t.string :content
      t.references :match, null: false, foreign_key: true

      t.timestamps
    end
  end
end
