class AddCleanToReviews < ActiveRecord::Migration[7.1]
  def change
    add_column :reviews, :clean, :integer
  end
end
