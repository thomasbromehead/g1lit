class AddNumberOfReviewsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :nb_of_reviews, :integer,  default: 0, null: false
  end
end
