class AddFemaleFriendlyToReviews < ActiveRecord::Migration[7.1]
  def change
    add_column :reviews, :female_friendly, :integer
  end
end
