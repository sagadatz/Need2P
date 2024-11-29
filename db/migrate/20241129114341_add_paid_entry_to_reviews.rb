class AddPaidEntryToReviews < ActiveRecord::Migration[7.1]
  def change
    add_column :reviews, :paid_entry, :integer
  end
end
