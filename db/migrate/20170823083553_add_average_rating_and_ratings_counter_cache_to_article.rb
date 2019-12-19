class AddAverageRatingAndRatingsCounterCacheToArticle < ActiveRecord::Migration[5.0]
  def change
    add_column :articles, :average_rating, :decimal, default: 0, null: false
    add_column :articles, :ratings_count, :integer, default: 0, null: false
  end
end
