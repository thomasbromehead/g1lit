class AddBookedToFlats < ActiveRecord::Migration[5.2]
  def change
    add_column :flats, :booked, :boolean, default: false, null: false
  end
end
