class AddCityToFlats < ActiveRecord::Migration[5.2]
  def change
    add_column :flats, :city, :string
  end
end
