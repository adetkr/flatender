class AddPresentationUniversityToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :presentation, :text
    add_column :users, :university, :string
  end
end
