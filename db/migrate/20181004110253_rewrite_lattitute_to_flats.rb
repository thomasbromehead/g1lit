class RewriteLattituteToFlats < ActiveRecord::Migration[5.2]
  def change
    rename_column :flats, :lattitude, :latitude
  end
end
