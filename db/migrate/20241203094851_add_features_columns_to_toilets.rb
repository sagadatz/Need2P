class AddFeaturesColumnsToToilets < ActiveRecord::Migration[7.1]
  def change
    add_column :toilets, :baby_friendly, :boolean
    add_column :toilets, :female_friendly, :boolean
  end
end
