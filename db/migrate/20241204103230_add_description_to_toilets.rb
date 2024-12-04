class AddDescriptionToToilets < ActiveRecord::Migration[7.1]
  def change
    add_column :toilets, :description, :text
  end
end
