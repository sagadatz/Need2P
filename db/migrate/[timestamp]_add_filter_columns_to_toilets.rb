class AddFilterColumnsToToilets < ActiveRecord::Migration[7.0]
  def change
    add_column :toilets, :female_friendly, :boolean, default: false
    add_column :toilets, :handicap_friendly, :boolean, default: false
    add_column :toilets, :family_friendly, :boolean, default: false
    add_column :toilets, :clean, :boolean, default: false
    add_column :toilets, :accessible, :boolean, default: false
    add_column :toilets, :paid, :boolean, default: false
    add_column :toilets, :rating, :float, default: 0.0
  end
end 
