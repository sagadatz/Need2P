class AddWellLocatedToReviews < ActiveRecord::Migration[7.1]
  def change
    add_column :reviews, :well_located, :integer
  end
end
