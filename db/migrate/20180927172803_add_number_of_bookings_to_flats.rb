class AddNumberOfBookingsToFlats < ActiveRecord::Migration[5.2]
  def change
    add_column :flats, :nb_of_bookings, :integer, default: 0, null: false
  end
end
