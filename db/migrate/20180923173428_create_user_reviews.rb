class CreateUserReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :user_reviews do |t|
      t.references :user, foreign_key: true
      t.text :content

      t.timestamps
    end
  end
end
