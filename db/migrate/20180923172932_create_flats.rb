class CreateFlats < ActiveRecord::Migration[5.2]
  def change
    create_table :flats do |t|
      t.integer :nb_rooms
      t.references :user, foreign_key: true
      t.boolean :animals
      t.integer :price_per_night, precision: 6, scale:2, default: 0, null: false
      t.boolean :smoking

      t.timestamps
    end
  end
end
