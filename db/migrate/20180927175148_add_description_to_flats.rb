class AddDescriptionToFlats < ActiveRecord::Migration[5.2]
  def change
    add_column :flats, :description, :text
  end
end
