class AddAvatarDataToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :avatar_data, :string
  end
end
