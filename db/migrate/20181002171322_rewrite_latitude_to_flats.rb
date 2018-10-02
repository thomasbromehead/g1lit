class RewriteLatitudeToFlats < ActiveRecord::Migration[5.2]
  def change
    rename_column :flats, :latitude, :lattitude
  end
end
