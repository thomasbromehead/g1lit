class AddNumberOfBathroomsToFlats < ActiveRecord::Migration[5.2]
  def change
    add_column :flats, :nb_of_bathrooms, :integer
  end
end
