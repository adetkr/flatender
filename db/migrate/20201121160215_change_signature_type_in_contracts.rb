class ChangeSignatureTypeInContracts < ActiveRecord::Migration[6.0]
  def change
    remove_column :contracts, :signature
    add_column :contracts, :signature, :datetime
  end
end
