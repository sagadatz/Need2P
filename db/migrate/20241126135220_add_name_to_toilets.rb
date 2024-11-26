class AddNameToToilets < ActiveRecord::Migration[7.1]
  def change
    add_column :toilets, :name, :string
  end
end
