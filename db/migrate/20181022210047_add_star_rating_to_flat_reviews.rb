class AddStarRatingToFlatReviews < ActiveRecord::Migration[5.2]
  def change
    add_column :flat_reviews, :star_rating, :float
  end
end
