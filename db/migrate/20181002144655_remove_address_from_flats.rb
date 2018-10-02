class RemoveAddressFromFlats < ActiveRecord::Migration[5.2]
  def change
    remove_column :flats, :address
  end
end
