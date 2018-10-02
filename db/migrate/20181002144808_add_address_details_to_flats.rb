class AddAddressDetailsToFlats < ActiveRecord::Migration[5.2]
  def change
    add_column :flats, :street, :string
    add_column :flats, :zip_code, :string
    add_column :flats, :country, :string
  end
end
