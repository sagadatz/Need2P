class AddAccessibleToToilets < ActiveRecord::Migration[7.1]
  def change
    add_column :toilets, :accessible, :boolean
  end
end
