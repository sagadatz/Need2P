class RemoveCategoryFromToilets < ActiveRecord::Migration[7.1]
  def change
    remove_column :toilets, :category, :string
  end
end
