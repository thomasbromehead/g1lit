class CreateFlatReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :flat_reviews do |t|
      t.text :content
      t.references :flat, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
