class AddNbOfBedsToFlats < ActiveRecord::Migration[5.2]
  def change
    add_column :flats, :nb_beds, :integer
  end
end
