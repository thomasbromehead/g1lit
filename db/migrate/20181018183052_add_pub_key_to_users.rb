class AddPubKeyToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :pubkey, :string
  end
end
