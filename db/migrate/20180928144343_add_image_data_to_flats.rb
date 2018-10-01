class AddImageDataToFlats < ActiveRecord::Migration[5.2]
  def change
    add_column :flats, :image_data, :text
  end
end
