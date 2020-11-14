class AddEnveloppeIdToContract < ActiveRecord::Migration[6.0]
  def change
    add_column :contracts, :enveloppe_id, :string
  end
end
