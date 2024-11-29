class AddDirtyToReviews < ActiveRecord::Migration[7.1]
  def change
    add_column :reviews, :dirty, :integer
  end
end
