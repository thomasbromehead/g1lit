class AddAddressToFlats < ActiveRecord::Migration[5.2]
  def change
    add_column :flats, :address, :string
  end
end
