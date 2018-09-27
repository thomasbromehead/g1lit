class AddCategoryToFlats < ActiveRecord::Migration[5.2]
  def change
    add_column :flats, :category, :string
  end
end
