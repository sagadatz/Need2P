class AddAccessibleToReviews < ActiveRecord::Migration[7.1]
  def change
    add_column :reviews, :accessible, :integer
  end
end
