class RenameEquipmentsToFlats < ActiveRecord::Migration[5.2]
  def change
    rename_column :flats, :equipements, :equipments
  end
end
