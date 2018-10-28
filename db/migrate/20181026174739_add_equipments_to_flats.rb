class AddEquipmentsToFlats < ActiveRecord::Migration[5.2]
  def change
    add_column :flats, :equipements, :text
  end
end
