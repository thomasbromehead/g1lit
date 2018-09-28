class AddPseudoG1ToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :pseudo_g1, :string
  end
end
